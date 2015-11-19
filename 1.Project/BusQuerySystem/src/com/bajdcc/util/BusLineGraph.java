package com.bajdcc.util;

import java.util.ArrayList;
import java.util.BitSet;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.HashMap;

import com.bajdcc.bean.BusPathBean;

public class BusLineGraph<LineType, SpotType> {

	private static final double SIMPLE_COST = 0.3;
	private HashListMap<SpotType> vertices = new HashListMap<>();
	private HashListMap<LineType> buslines = new HashListMap<>();
	private List<Double> buscost = new ArrayList<>();
	private Map<Integer, Vertex> edges = new HashMap<>();
	private int busIdx = 0;

	public List<LineType> getDirectPath(SpotType beginLabel, SpotType endLabel) {
		Vertex begin = getVertexBySpot(beginLabel);
		if (begin == null) {
			return null;
		}
		Vertex end = getVertexBySpot(endLabel);
		if (end == null) {
			return null;
		}
		if (begin.getLabel() == end.getLabel()) {
			return Collections.emptyList();
		}
		Collection<Integer> begins = begin.getAllLines();
		Collection<Integer> ends = end.getAllLines();
		begins.retainAll(ends);
		if (begins.isEmpty()) {
			return null;
		}
		return getLines(begins);
	}

	public List<BusPathBean<LineType, SpotType>> getShortestPath(
			SpotType beginLabel, SpotType endLabel) {
		Vertex begin = getVertexBySpot(beginLabel);
		if (begin == null) {
			return null;
		}
		Vertex end = getVertexBySpot(endLabel);
		if (end == null) {
			return null;
		}
		if (begin.getLabel() == end.getLabel()) {
			return Collections.emptyList();
		}
		BitSet visited = new BitSet();
		List<Double> dist = new ArrayList<>();
		List<Integer> prev = new ArrayList<>();
		List<Collection<Integer>> busline = new ArrayList<>();
		int size = vertices.size();
		for (int i = 0; i < size; i++) {
			dist.add(Double.MAX_VALUE);
			prev.add(-1);
			busline.add(null);
		}
		dist.set(begin.getLabel(), 0.0);
		visited.clear();
		visited.set(begin.getLabel());
		for (Entry<Integer, Edge> originEdge : begin.getEdges()) {
			dist.set(originEdge.getKey(), getAverageCost(originEdge.getValue()
					.getLine()));
			prev.set(originEdge.getKey(), originEdge.getValue().getBegin());
			busline.set(originEdge.getKey(), originEdge.getValue().getLine());
		}
		for (int i = 1; i < size; i++) {
			double tmp = Double.MAX_VALUE;
			int u = -1;
			for (int j = 0; j < size; ++j) {
				if (!visited.get(j) && dist.get(j) < tmp) {
					u = j;
					tmp = dist.get(j);
				}
			}
			if (u == -1) {
				break;
			}
			visited.set(u);
			for (int j = 0; j < size; ++j) {
				if (visited.get(j)) {
					continue;
				}
				Collection<Integer> line = getConnectedBusLine(u, j);
				if (line != null) {
					double newdist = dist.get(u) + SIMPLE_COST;
					Collection<Integer> prevBus = busline.get(u);
					List<Integer> newBus = new ArrayList<>(prevBus);
					newBus.retainAll(line);
					if (newBus.isEmpty()) {
						newdist += getAverageCost(line);
					}
					if (newdist < dist.get(j)) {
						dist.set(j, newdist);
						prev.set(j, u);
						if (!newBus.isEmpty()) {
							busline.set(j, newBus);
						} else {
							busline.set(j, line);
						}
					}
				}
			}
		}
		List<BusPathBean<LineType, SpotType>> path = new ArrayList<>();
		int itIndex = end.getLabel();
		Collection<Integer> busprev = null;
		while (itIndex != -1) {
			Collection<Integer> itBus = busline.get(itIndex);
			if (itBus == null) {
				break;
			}
			System.out.println(String.format("[DEBUG] ~P2P~ -- %s - %s / %f", getLines(itBus)
					.toString(), vertices.get(itIndex), dist.get(itIndex)));
			if (busprev != null) {
				List<Integer> newBus = new ArrayList<>(itBus);
				newBus.retainAll(busprev);
				if (!newBus.isEmpty()) {
					itBus = newBus;
				}
			}
			BusPathBean<LineType, SpotType> tmpNode = new BusPathBean<>();
			tmpNode.setEnd(vertices.get(itIndex));
			tmpNode.setLine(getLines(itBus));
			path.add(0, tmpNode);
			itIndex = prev.get(itIndex);
			busprev = itBus;
		}
		path.get(0).setBegin(beginLabel);
		for (int i = 1; i < path.size(); i++) {
			path.get(i).setBegin(path.get(i - 1).getEnd());
		}
		return path;
	}

	public void addEdge(SpotType beginLabel, SpotType endLabel, LineType busLine) {
		int beginIndex = vertices.put(beginLabel);
		int endIndex = vertices.put(endLabel);
		int lineIndex = buslines.put(busLine);
		Vertex beginVertex = addVertex(beginIndex, beginLabel);
		Vertex endVertex = addVertex(endIndex, endLabel);
		beginVertex.connect(endVertex, beginIndex, endIndex, lineIndex);
		endVertex.connect(beginVertex, endIndex, beginIndex, lineIndex);
	}

	public void addCost(LineType busLine, double cost) {
		buscost.add(cost);
		busIdx++;
	}

	private Vertex addVertex(int beginIndex, SpotType beginLabel) {
		if (!edges.containsKey(beginIndex)) {
			Vertex vertex = new Vertex(beginIndex);
			edges.put(beginIndex, vertex);
			return vertex;
		}
		return edges.get(beginIndex);
	}

	private Vertex getVertexBySpot(SpotType label) {
		if (vertices.contains(label)) {
			int index = vertices.indexOf(label);
			return edges.get(index);
		}
		return null;
	}

	private Collection<Integer> getConnectedBusLine(int begin, int end) {
		return edges.get(begin).getConnectedBusLine(end);
	}

	private double getAverageCost(Collection<Integer> busIndex) {
		double sum = 0.0;
		for (int index : busIndex) {
			sum += buscost.get(index);
		}
		return sum / busIndex.size();
	}

	private List<LineType> getLines(Collection<Integer> busIndex) {
		List<LineType> lines = new ArrayList<>();
		for (int index : busIndex) {
			lines.add(buslines.get(index));
		}
		return lines;
	}

	public BusLineGraph() {
	}
}

class Vertex {
	private final int label;
	private Map<Integer, Edge> edgeList;

	public Vertex(int label) {
		this.label = label;
		this.edgeList = new HashMap<>();
	}

	public Collection<Entry<Integer, Edge>> getEdges() {
		return edgeList.entrySet();
	}

	public Collection<Integer> getEnds() {
		return edgeList.keySet();
	}

	public Collection<Edge> getLines() {
		return edgeList.values();
	}

	public Collection<Integer> getAllLines() {
		Collection<Integer> lines = new HashSet<Integer>();
		for (Edge edge : edgeList.values()) {
			lines.addAll(edge.getLine());
		}
		return lines;
	}

	public int getLabel() {
		return label;
	}

	public Collection<Integer> getConnectedBusLine(int end) {
		if (!edgeList.containsKey(end)) {
			return null;
		} else {
			return edgeList.get(end).getLine();
		}
	}

	public void connect(Vertex end, int beginIndex, int endIndex, int line) {
		if (!this.equals(end)) {
			Edge edge = edgeList.get(endIndex);
			if (edge == null) {
				edgeList.put(endIndex, new Edge(beginIndex, line));
			} else {
				edge.addLine(line);
			}
		}
	}

	@Override
	public boolean equals(Object object) {
		if (this == object)
			return true;
		if (object instanceof Vertex) {
			Vertex otherVertex = (Vertex) object;
			return this.label == otherVertex.label;
		}
		return false;
	}
}

class Edge {
	private final int begin;
	private Set<Integer> lines = new HashSet<Integer>();

	public Edge(int begin, int line) {
		this.begin = begin;
		addLine(line);
	}

	public void addLine(int line) {
		lines.add(line);
	}

	protected int getBegin() {
		return begin;
	}

	protected Collection<Integer> getLine() {
		return lines;
	}
}