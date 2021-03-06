USE [master]
GO
/****** Object:  Database [bus]    Script Date: 2015/6/22 20:12:45 ******/
CREATE DATABASE [bus] ON  PRIMARY 
( NAME = N'bus', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\bus.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bus_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\bus_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bus] SET ARITHABORT OFF 
GO
ALTER DATABASE [bus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bus] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bus] SET  MULTI_USER 
GO
ALTER DATABASE [bus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bus] SET DB_CHAINING OFF 
GO
USE [bus]
GO
/****** Object:  Table [dbo].[account]    Script Date: 2015/6/22 20:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[super] [int] NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bus]    Script Date: 2015/6/22 20:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[route] [nvarchar](500) NOT NULL,
	[start_time] [nchar](10) NOT NULL,
	[end_time] [nchar](10) NOT NULL,
	[price] [numeric](8, 2) NOT NULL,
	[update_time] [datetime] NOT NULL CONSTRAINT [DF_bus_update_time]  DEFAULT (getdate()),
 CONSTRAINT [PK_bus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[msg]    Script Date: 2015/6/22 20:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msg](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NOT NULL,
	[ip] [nvarchar](30) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[body] [nvarchar](500) NOT NULL,
	[time] [datetime] NOT NULL CONSTRAINT [DF_msg_time]  DEFAULT (getdate()),
 CONSTRAINT [PK_msg] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[account] ON 

GO
INSERT [dbo].[account] ([id], [name], [password], [super]) VALUES (1, N'test', N'test', 1)
GO
INSERT [dbo].[account] ([id], [name], [password], [super]) VALUES (2, N'a', N'a', 1)
GO
INSERT [dbo].[account] ([id], [name], [password], [super]) VALUES (3, N'c', N'c', 2)
GO
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[bus] ON 

GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (1, N'1路', N'福裕->谢桥镇（健康路）->谢桥转盘->谢桥管理区->方浜工业园->新桥路口->江河公司->胜利加油站->常熟老街->勤丰村->建发医药->常熟移动公司->客运站->常熟电信局->常客隆->中国银行->平安人寿->第二人民医院->华联宾馆->交通大厦->阜湖路(瑞兴医院)->琴川家园->红旗桥->世纪联华->中国男装中心(长途站)->天虹服装城->一号桥->花园浜->红旗桥->琴川家园->阜湖路(瑞兴医院)->交通大厦->华联宾馆->第二人民医院->平安人寿->中国银行->常客隆->常熟电信局->客运站->常熟移动公司->建发医药->勤丰村->常熟老街->加油站->江河公司->新桥路口->方浜工业园->谢桥管理区->谢桥转盘->谢桥镇（健康路）->福裕', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (2, N'2路', N'常熟老街->勤丰村->建发医药->常熟移动公司->客运站->常熟电信局->新加坡花园->如家快捷酒店->漕泾菜场->污水厂->昭文路->国税中心->市政府->信泰证券->利明齿科(明日枫林)->大东门->庆福银楼->麦当劳（街心花园）->书院街->第一人民医院->甸桥新村->理工学院（元和校区）->尚湖中央花园->仁和医院->天虹服装城->一号桥->花园浜->世纪联华->中国男装中心(长途站)->仁和医院->尚湖中央花园->理工学院（元和校区）->甸桥新村->第一人民医院->书院街->麦当劳（街心花园）->庆福银楼->大东门->利明齿科(明日枫林)->信泰证券->市政府->国税中心->昭文路->污水厂->漕泾菜场->如家快捷酒店->新加坡花园->常熟电信局->客运站->常熟移动公司->建发医药->勤丰村->常熟老街', N'6:00      ', N'12:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (3, N'4路', N'新区医院->润欣花园->名都花苑->明珠小区->新加坡花园->如家快捷酒店->漕泾新村->经贸大厦->中国银行->平安人寿->第二人民医院->华联宾馆->颜港小学->琴湖新村->琴湖路(常熟惠民医院)->琴湖公园->广播电台->杨家桥->佳和水岸->时装中心->招商分局->富通物流->理工学院（东湖校区）', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (4, N'5路', N'新区医院->润欣花园->名都花苑->泰慈花园->客运站->五星中队->长江花园->南沙路->长江西路->长江路(锦江之星)->甬江路->梅园宾馆->肝病防治中心->桃源涧->虞山公园->言子墓->博物馆->书院街->第一人民医院->甸桥新村->理工学院（元和校区）->尚湖中央花园->仁和医院->招商南路->仕德伟->服装城->富通物流->理工学院（东湖校区）', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (5, N'6路', N'琴枫苑->申大->宏基宾馆->杜家村->李家桥->李闸路->利明齿科(明日枫林)->大东门->南京证券（新颜桥）->琴川家园->红旗桥->花园浜->一号桥->天虹服装城->招商南路->五号桥->安定->农贸市场->盛豪公司->莫城园区->莫城', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (6, N'7路', N'客运站->实验小学->实验小学（黄河路）->雷允上->欧尚黄河店->明日星城->夏普->国际饭店->兴福->甬江路->梅园宾馆->肝病防治中心->桃源涧->虞山公园->言子墓->博物馆->书院街->第一人民医院->善祥商厦->人民桥车站->琴川家园->阜湖路(瑞兴医院)->交通大厦->华联宾馆->第二人民医院->平安人寿->中国银行->常客隆->常熟电信局->客运站', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (7, N'8路', N'客运站->常熟电信局->常客隆->中国银行->平安人寿->第二人民医院->华联宾馆->交通大厦->阜湖路(瑞兴医院)->琴川家园->人民桥车站->善祥商厦->第一人民医院->书院街->博物馆->言子墓->虞山公园->桃源涧->肝病防治中心->梅园宾馆->甬江路->兴福->国际饭店->夏普->明日星城->欧尚黄河店->雷允上->实验小学->客运站', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (8, N'9路', N'理工学院（东湖校区）->南三环路->安定->五号桥->招商南路->仁和医院->尚湖中央花园->理工学院（元和校区）->甸桥新村->第一人民医院->书院街->博物馆->言子墓->虞山公园->桃源涧->肝病防治中心->梅园宾馆->甬江路->兴福->国际饭店->外国语学校->联盟小区->三峰->北三环路->林场工业园->合丰村->合丰菜场->雪龙电器->中江公司->金华路站->重机厂', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (9, N'10路', N'古里敬老院->古里镇政府->古里卫生院->古里中学->银河北路->湖口站->钱仓站->新桥站->拆车厂->建材市场（东）->建材市场->东三环->机驾培训中心->荷花村->市公安局->青墩塘加油站->印象城购物中心->第二人民医院->华联宾馆->农工商超市->里颜港->庆福银楼->麦当劳（街心花园）->石梅广场->市一中->甸桥->甸新路->盛家浜->山湖苑->湖甸', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (10, N'11路', N'名流世纪->新通润->新龙腾工业园->红枫苑->协和->世纪大道（东）->兴裕园->新加坡花园->如家快捷酒店->漕泾菜场->污水厂->博隆家居->青墩塘加油站->印象城购物中心->第二人民医院->华联宾馆->交通大厦->阜湖路(瑞兴医院)->琴川家园->人民桥车站->善祥商厦->甸桥新村->理工学院（元和校区）->尚湖中央花园->金枫花园', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (11, N'101路', N'建华->斜桥水厂->制药机械厂->南浜->南三环->安定->五号桥->仕德伟->国际服装城->时装中心->中国男装中心(长途站)->天虹服装城->一号桥->花园浜->红旗桥->琴川家园->南京证券（新颜桥）->大东门->环城北路->菱塘新村->报慈新村->第五人民医院->报慈北路->博爱门诊部->常福菜场->夏普->麦芝西柏->联丰路->徐州路->高新技术产业园->中江公司->金华路站->重机厂', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (12, N'102路', N'花溪新村->花溪小区->荡墩路->佳和水岸->杨家桥->广播电台->琴湖公园->琴湖路(常熟惠民医院)->琴湖新村->青墩塘加油站->印象城购物中心->平安人寿->中国银行->体育馆->珠江路->金麟饭店(李家桥)->第五人民医院->梅园宾馆->甬江路->兴福->国际饭店->外国语学校->联盟小区->三峰->常熟开关制造有限公司->富士电机->中江公司->金华路站->重机厂', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (13, N'103路', N'达富北站->青岛路->大连路->达富电脑南站->金华路->量刃具厂->药机厂->柏宾服饰->珠海路->帽厂->麦芝西柏->夏普->明日星城->欧尚黄河店->雷允上->实验小学->杜家村->辛峰小学->五星新村->市政府->凯尔顿广场(开发大厦)->大东门->南京证券（新颜桥）->琴川家园->红旗桥->世纪联华->中国男装中心(长途站)->天虹服装城->一号桥->花园浜->红旗桥->琴川家园->南京证券（新颜桥）->大东门->凯尔顿广场(开发大厦)->市政府->五星新村->辛峰小学->杜家村->实验小学->实验小学（黄河路）->雷允上->欧尚黄河店->明日星城->夏普->麦芝西柏->帽厂->珠海路->柏宾服饰->药机厂->量刃具厂->金华路->达富电脑南站->大连路->青岛路->达富北站', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (14, N'104路', N'建材市场->东三环->机驾培训中心->荷花村->市公安局->琴湖新村->琴湖新村（新颜东路）->颜港小学->农工商超市->里颜港->庆福银楼->麦当劳（街心花园）->书院街->第一人民医院->甸桥新村->理工学院（元和校区）->尚湖中央花园->仁和医院->中国男装中心(长途站)->佳和水岸->杨家桥->广播电台->琴湖公园->琴湖路(常熟惠民医院)->湖苑新村->世纪大道->锦荷佳苑->金山菜场->锦绣苑(金山苑)->富春江路->交警大队->禧徕乐家居->禧徕乐家居（东）->国际汽配城->新桥站->拆车厂->建材市场（东）->建材市场', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (15, N'105路', N'建材市场->建材市场（东）->拆车厂->新桥站->国际汽配城->禧徕乐家居（东）->禧徕乐家居->交警大队->富春江路->锦绣苑(金山苑)->金山菜场->锦荷佳苑->世纪大道->湖苑新村->琴湖路(常熟惠民医院)->琴湖公园->广播电台->杨家桥->佳和水岸->中国男装中心(长途站)->仁和医院->尚湖中央花园->理工学院（元和校区）->甸桥新村->第一人民医院->书院街->麦当劳（街心花园）->庆福银楼->里颜港->农工商超市->颜港小学->琴湖新村（新颜东路）->琴湖新村->市公安局->荷花村->机驾培训中心->东三环->建材市场', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (16, N'108路', N'市一中->石梅广场->麦当劳（街心花园）->庆福银楼->里颜港->农工商超市->颜港小学->琴湖新村->湖苑新村->世纪大道->锦荷佳苑->金山菜场->锦绣苑（金山苑）->镇政府->富阳路->香榭路->梦兰村->新安江路->职教中心->东渔村->金仓集贸市场->东南管委会->苏锋工业坊', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (17, N'109路', N'淼泉镇->淼泉卫生院->淼泉工业园->大虹桥->花桥站->兴隆桥->九里加油站->九里大街->虹桥管理区->世茂中心->博隆家居->香格丽花园->锁澜路->泰安街->引线街->博物馆->书院街->第一人民医院->善祥商厦->人民桥车站->红旗桥->世纪联华->中国男装中心(长途站)->天虹服装城->一号桥->花园浜->红旗桥->人民桥车站->善祥商厦->第一人民医院->书院街->博物馆->引线街->泰安街->锁澜路->香格丽花园->博隆家居->世茂中心->虹桥管理区->九里大街->九里加油站->兴隆桥->花桥站->大虹桥->淼泉工业园->淼泉卫生院->淼泉镇', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (18, N'109B路', N'淼泉镇->长浜站->海晏桥->油麻泾站->服装一厂->净心院->大虹桥->花桥站->兴隆桥->九里加油站->九里大街->虹桥管理区->世茂中心->博隆家居->香格丽花园->锁澜路->泰安街->引线街->博物馆->书院街->第一人民医院->善祥商厦->人民桥车站->红旗桥->世纪联华->中国男装中心(长途站)->天虹服装城->一号桥->花园浜->红旗桥->人民桥车站->善祥商厦->第一人民医院->书院街->博物馆->引线街->泰安街->锁澜路->香格丽花园->博隆家居->世茂中心->虹桥管理区->九里大街->九里加油站->兴隆桥->花桥站->大虹桥->净心院->服装一厂->油麻泾站->海晏桥->长浜站->淼泉镇', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (19, N'110路', N'花溪小区->荡墩路->世纪联华->红旗桥->人民桥车站->善祥商厦->第一人民医院->书院街->博物馆->言子墓->虞山公园->桃源涧->肝病防治中心->第五人民医院->报慈北路->博爱门诊部->常福菜场->明日星城->欧尚黄河店->雷允上->实验小学（黄河路->泰慈花园（客运站）->泰慈苑->锦湖花园->润欣花园->新区医院->泯泾路口->龙腾住宅区->红枫小学->新龙腾工业园->新区医院->润欣花园->锦湖花园->泰慈苑->泰慈花园（客运站）->实验小学（黄河路）->雷允上->欧尚黄河店->明日星城->常福菜场->博爱门诊部->报慈北路->第五人民医院->肝病防治中心->桃源涧->虞山公园->言子墓->博物馆->书院街->第一人民医院->善祥商厦->人民桥车站->红旗桥->世纪联华->荡墩路->花溪小区', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (20, N'111路', N'沙家浜景区->芦苇荡路->水产市场->沙家浜镇->S227省道->安达洲物流->苏锋工业坊->东南管委会->东渔村->职教中心->恩斯克轴承->庐山新村->庐山路->黄山路->热电厂->新安江路->藕渠加油站->藕渠->藕渠中学->百盛花园->富兴路->沙家浜路->杨家桥->佳和水岸->世纪联华->红旗桥->跨塘桥->人民桥车站->红旗桥->世纪联华->佳和水岸->杨家桥->沙家浜路->富兴路->百盛花园->藕渠中学->藕渠->藕渠加油站->新安江路->热电厂->黄山路->庐山路->庐山新村->恩斯克轴承->职教中心->东渔村->东南管委会->苏锋工业坊->安达洲物流->S227省道->沙家浜镇->水产市场->芦苇荡路->沙家浜景区', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (21, N'112路', N'客运站->实验小学->雷允上->欧尚黄河店->明日星城->常福菜场->博爱门诊部->报慈北路->第五人民医院->报慈新村->菱塘新村->北门大街->虞山公园->言子墓->博物馆->麦当劳（街心花园）->庆福银楼->南京证券（新颜桥）->阜湖路(瑞兴医院)->交通大厦->颜港小学->琴湖新村->湖苑新村->世纪大道->市中->体育中心->省中->世茂中心->博隆家居->污水厂->漕泾菜场->如家快捷酒店->新加坡花园->明珠小区->泰慈花园（客运站）->客运站', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (22, N'113路', N'客运站->泰慈花园（客运站）->明珠小区->新加坡花园->如家快捷酒店->漕泾菜场->污水厂->博隆家居->世茂中心->省中->体育中心->市中->世纪大道->湖苑新村->琴湖新村->颜港小学->交通大厦->阜湖路(瑞兴医院)->南京证券（新颜桥）->庆福银楼->麦当劳（街心花园）->博物馆->言子墓->虞山公园->北门大街->菱塘新村->报慈新村->第五人民医院->报慈北路->博爱门诊部->常福菜场->明日星城->欧尚黄河店->雷允上->实验小学->客运站', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (23, N'114路', N'新区医院->红枫苑->兴隆派出所->九里大街->虹桥管理区->世茂中心->博隆家居->香格丽花园->金沙江路->凯尔顿广场(开发大厦)->环城北路->北门大街->虞山公园->言子墓->博物馆->书院街->第一人民医院->甸桥新村->理工学院（元和校区）->尚湖中央花园->仁和医院->中国男装中心(长途站)->佳和水岸->杨家桥->广播电台->琴湖公园->琴湖路(常熟惠民医院)->琴湖新村->市公安局->市中->省中->虹桥管理区->九里大街->兴隆派出所->红枫苑->新区医院', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (24, N'115路', N'新区医院->红枫苑->兴隆派出所->九里大街->虹桥管理区->省中->市中->市公安局->琴湖新村->琴湖路(常熟惠民医院)->琴湖公园->广播电台->杨家桥->佳和水岸->中国男装中心(长途站)->仁和医院->尚湖中央花园->理工学院（元和校区）->甸桥新村->第一人民医院->书院街->博物馆->言子墓->虞山公园->北门大街->环城北路->凯尔顿广场(开发大厦)->金沙江路->香格丽花园->博隆家居->世茂中心->虹桥管理区->九里大街->兴隆派出所->红枫苑->新区医院', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (25, N'116路', N'客运站->明珠小区->新加坡花园->如家快捷酒店->漕泾新村->经贸大厦->体育馆->珠江路->金麟饭店(李家桥)->第五人民医院->肝病防治中心->桃源涧->虞山公园->言子墓->博物馆->书院街->第一人民医院->甸桥新村->理工学院（元和校区）->尚湖中央花园->金枫花园->造纸厂->朱泾村（元和苑）->建华新村->建华->颜巷菜场->尚湖风景区->渡假村', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (26, N'117路', N'客运站->常熟电信局->常客隆->中国银行->平安人寿->第二人民医院->华联宾馆->农工商超市->里颜港->庆福银楼->麦当劳（街心花园）->石梅广场->市一中->甸桥->救管站->安全培训中心->玻钢厂->三星村->军营->景秀园->尚湖->尚湖高级中学', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (27, N'118路', N'言子墓->虞山门->公墓->维摩->桂香园->祖师', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (28, N'119路', N'客运站->常熟电信局->新加坡花园->如家快捷酒店->漕泾菜场->污水厂->昭文路->国税中心->平安人寿->第二人民医院->华联宾馆->颜港小学->琴湖新村->湖苑新村->世纪大道->锦荷佳苑->金山菜场->锦绣苑（金山苑）->镇政府->百盛花园->富鑫苑->百盛花园->藕渠中学->藕渠->藕渠加油站->渠中大桥->前港工业园->东南大道->苏锋村->黄浦江路->金仓集贸市场->东南管委会->职教中心', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (29, N'120路', N'千仞岗->光明路站->大义->大义菜场->大义中学->小山->白云加油站->三峰->联盟小区->外国语学校->国际饭店->兴福->甬江路->梅园宾馆->肝病防治中心->桃源涧->北门大街->环城北路->大东门->南京证券（新颜桥）->琴川家园->红旗桥->世纪联华->中国男装中心(长途站)->天虹服装城->一号桥->花园浜->红旗桥->琴川家园->南京证券（新颜桥）->大东门->环城北路->北门大街->桃源涧->肝病防治中心->梅园宾馆->甬江路->兴福->国际饭店->外国语学校->联盟小区->三峰->白云加油站->小山->大义中学->大义菜场->大义->光明路站->千仞岗', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (30, N'121路', N'压路机村->大金家巷站->宏亚革业->华通印刷->鸽球印染->四新路站->光明村->民乐站->大义市场->小义村->达富电脑南站->金华路->量刃具厂->药机厂->柏宾服饰->珠海路->帽厂->麦芝西柏->夏普->明日星城->欧尚黄河店->雷允上->实验小学->杜家村->辛峰小学->五星新村->市政府->凯尔顿广场(开发大厦)->大东门->南京证券（新颜桥）->琴川家园->红旗桥->世纪联华->中国男装中心(长途站)->天虹服装城->一号桥->花园浜->红旗桥->琴川家园->南京证券（新颜桥）->大东门->凯尔顿广场(开发大厦)->市政府->五星新村->辛峰小学->杜家村->实验小学->实验小学(黄河路)->雷允上->欧尚黄河店->明日星城->夏普->麦芝西柏->帽厂->珠海路->柏宾服饰->药机厂->量刃具厂->金华路->达富电脑南站->小义村->大义市场->民乐站->光明村->四新路站->鸽球印染->华通印刷->宏亚革业->大金家巷站->压路机村', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (31, N'122路', N'第一人民医院->善祥商厦->人民桥车站->红旗桥->花园浜->一号桥->天虹服装城->招商南路->五号桥->安定->农贸市场->盛豪公司->莫城园区->莫城->湖滨路口->建桥路口->高泾->青洲->青洲小学->惠顺不锈钢厂->村卫生室->唐家娄->东青村', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (32, N'123路', N'第一人民医院->善祥商厦->人民桥车站->红旗桥->花园浜->一号桥->天虹服装城->招商南路->五号桥->安定->农贸市场->盛豪公司->莫城园区->莫城->湖滨路口->建桥路口->建桥->东始->毛家桥->堆坊->徐巷->双巷', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (33, N'124路', N'第一人民医院->善祥商厦->人民桥车站->红旗桥->花园浜->一号桥->天虹服装城->招商南路->五号桥->安定->农贸市场->盛豪公司->莫城园区->莫城->莫城东街->莫城卫生院->计巷->殷庄->田庄->莫城弹簧厂->沈家浜->凌桥', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (34, N'125路', N'麦当劳（街心花园）->石梅广场->市一中->甸桥->救管站->安全培训中心->玻钢厂->三星村->军营->生态园->宝岩->落星岗->白鸽峰->石洞景区->邹巷->湖桥->泄水->归一苑->雅博针织厂->尚湖村->葡萄园->蒋巷', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (35, N'127路', N'古里布匹市场->华懋纺织->洁福地板->福懋兴业->东南交警中队->锦湖电机->丰盈机械->豪冠科技->中欧汽车->双猫->华坤物流->禧徕乐家居->交警大队->富春江路->镇政府->锦绣苑->金山菜场->锦荷佳苑->市公安局->青墩塘加油站->印象城购物中心->第二人民医院->华联宾馆->颜港小学->琴湖新村->湖苑新村->世纪大道->锦荷佳苑->金山菜场->锦绣苑->富春江路->交警大队->喜徕乐家居->华坤物流->双猫->中欧汽车->豪冠科技->丰盈机械->锦湖电机->东南交警中队->福懋兴业->洁福地板->华懋纺织->古里布匹市场', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (36, N'129路', N'寺基村->中泾->陆家角->金星->小义->大义中学', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
INSERT [dbo].[bus] ([id], [name], [route], [start_time], [end_time], [price], [update_time]) VALUES (37, N'130路', N'光明制笔厂->和甸村->博马织造->环来泾路站->金天地新村->恩潭路站->燕泾路站->康达辅料->马泾小学->南浜->南三环->理工学院（东湖校区）->富通物流->国际服装城', N'6:00      ', N'18:00     ', CAST(2.00 AS Numeric(8, 2)), CAST(N'2015-06-22 12:26:34.480' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[bus] OFF
GO
SET IDENTITY_INSERT [dbo].[msg] ON 

GO
INSERT [dbo].[msg] ([id], [uid], [ip], [title], [body], [time]) VALUES (32, 2, N'127.0.0.1', N'test', N'test', CAST(N'2015-06-14 14:42:40.700' AS DateTime))
GO
INSERT [dbo].[msg] ([id], [uid], [ip], [title], [body], [time]) VALUES (33, 1, N'127.0.0.1', N'ok', N'ok', CAST(N'2015-06-14 14:44:32.937' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[msg] OFF
GO
ALTER TABLE [dbo].[msg]  WITH CHECK ADD  CONSTRAINT [FK_uid] FOREIGN KEY([uid])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[msg] CHECK CONSTRAINT [FK_uid]
GO
/****** Object:  StoredProcedure [dbo].[Add_Line]    Script Date: 2015/6/22 20:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Line]
		@L_NAME NVARCHAR(50),  
		@L_ROUTE NVARCHAR(500) = '',  
		@L_START_TIME NCHAR(10),
		@L_END_TIME NCHAR(10),
		@L_PRICE NUMERIC(8, 2) = 0
	AS  
BEGIN
	IF EXISTS (
		SELECT * FROM [dbo].[bus]
		WHERE [name] = @L_NAME )
	RETURN 1;

	BEGIN TRY
	INSERT INTO [dbo].[bus] VALUES(
		@L_NAME, @L_ROUTE, @L_START_TIME, @L_END_TIME, @L_PRICE, DEFAULT
	);
	END TRY
	BEGIN CATCH
		RETURN 3;
	END CATCH	
	RETURN 2;
END

GO
/****** Object:  StoredProcedure [dbo].[Delete_Line]    Script Date: 2015/6/22 20:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_Line]
		@L_NAME NVARCHAR(50)		
	AS  
BEGIN
	IF NOT EXISTS (
		SELECT * FROM [dbo].[bus]
		WHERE [name] = @L_NAME )
	RETURN 1;

	BEGIN TRY
	DELETE FROM [dbo].[bus] WHERE [dbo].[bus].[name] = @L_NAME
	END TRY
	BEGIN CATCH
		RETURN 3;
	END CATCH
	RETURN 2;
END

GO
/****** Object:  StoredProcedure [dbo].[Update_Line]    Script Date: 2015/6/22 20:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Line]
		@L_NAME NVARCHAR(50),  
		@L_ROUTE NVARCHAR(500) = '',  
		@L_START_TIME NCHAR(10),
		@L_END_TIME NCHAR(10),
		@L_PRICE NUMERIC(8, 2) = 0
	AS  
BEGIN
	IF NOT EXISTS (
		SELECT * FROM [dbo].[bus]
		WHERE [name] = @L_NAME )
	RETURN 1;

	BEGIN TRY
	UPDATE [dbo].[bus] SET
		[dbo].[bus].[name] = @L_NAME,
		[dbo].[bus].[route] = @L_ROUTE,
		[dbo].[bus].[start_time] = @L_START_TIME,
		[dbo].[bus].[end_time] = @L_END_TIME,
		[dbo].[bus].[price] = @L_PRICE
	WHERE [dbo].[bus].[name] = @L_NAME
	END TRY
	BEGIN CATCH
		RETURN 3;
	END CATCH	
	RETURN 2;
END

GO
/****** Object:  Trigger [dbo].[Update_Line_Time]    Script Date: 2015/6/22 20:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Update_Line_Time]
	ON [dbo].[bus]
	AFTER UPDATE
	AS
BEGIN
	Update [dbo].[bus]
	SET [dbo].[bus].[update_time] = getdate()
	WHERE [dbo].[bus].[id]
	IN(
		SELECT [id] FROM inserted
	)
END

GO
USE [master]
GO
ALTER DATABASE [bus] SET  READ_WRITE 
GO
