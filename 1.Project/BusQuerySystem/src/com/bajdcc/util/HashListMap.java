package com.bajdcc.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 哈希表
 * <p>
 * T->id,T=list,id=list indexof T
 * </p>
 * 
 * @author bajdcc
 */
public class HashListMap<T> {

	public Map<T, Integer> map = new HashMap<>();

	public List<T> list = new ArrayList<>();

	public boolean contains(T t) {
		return map.containsKey(t);
	}

	public void add(T t) {
		if (!map.containsKey(t)) {
			map.put(t, list.size());
			list.add(t);
		}
	}
	
	public T get(int index) {
		return list.get(index);
	}

	public int put(T t) {
		if (map.containsKey(t)) {
			return map.get(t);
		}
		add(t);
		return list.size() - 1;
	}

	public int indexOf(T t) {
		return map.get(t);
	}

	public int size() {
		return list.size();
	}
}