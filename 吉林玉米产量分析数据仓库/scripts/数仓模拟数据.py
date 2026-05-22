import pandas as pd
import numpy as np

# 全局固定配置（和业务设计完全匹配）
city_list = ["长春市", "吉林市", "四平市", "松原市", "白城市", "辽源市"]  # 中文城市名
year_list = [2020, 2021, 2022, 2023, 2024]  # 5年数据周期
disaster_types = ["干旱", "洪涝", "玉米螟", "风灾", "霜冻"]  # 中文灾害类型

# 1. 气象表 ods_weather_day（按日分区）
def gen_weather():
    data = []
    for year in year_list:
        for city in city_list:
            # 只生成玉米生长季数据（4-9月）
            date_range = pd.date_range(f"{year}-04-01", f"{year}-09-30", freq="D")
            for date in date_range:
                data.append({
                    "dt": date.strftime("%Y-%m-%d"),  # 日期格式：2020-04-01
                    "city": city,
                    "avg_temp": round(np.random.uniform(12.0, 28.0), 1),  # 合理气温范围
                    "max_temp": round(np.random.uniform(18.0, 35.0), 1),
                    "min_temp": round(np.random.uniform(5.0, 20.0), 1),
                    "rainfall": round(np.random.uniform(0.0, 30.0), 1),  # 降雨量（mm）
                    "humidity": np.random.randint(40, 90),  # 湿度（%）
                    "sun_hour": round(np.random.uniform(2.0, 13.0), 1)  # 日照时长（小时）
                })
    # 关键：指定encoding='gbk'，Excel打开无乱码
    pd.DataFrame(data).to_csv("ods_weather_day.csv", index=False, encoding="gbk")

# 2. 土壤表 ods_soil_monitor（按日分区）
def gen_soil():
    data = []
    for year in year_list:
        for city in city_list:
            date_range = pd.date_range(f"{year}-04-01", f"{year}-09-30", freq="D")
            for date in date_range:
                data.append({
                    "dt": date.strftime("%Y-%m-%d"),
                    "city": city,
                    "soil_temp": round(np.random.uniform(10.0, 25.0), 1),  # 土壤温度
                    "soil_humidity": np.random.randint(30, 85),  # 土壤湿度（%）
                    "ph_value": round(np.random.uniform(5.0, 8.5), 1),  # 土壤PH值（合理范围）
                    "nitrogen": round(np.random.uniform(50.0, 150.0), 1),  # 氮含量（mg/kg）
                    "phosphorus": round(np.random.uniform(20.0, 80.0), 1),  # 磷含量
                    "potassium": round(np.random.uniform(60.0, 120.0), 1)  # 钾含量
                })
    pd.DataFrame(data).to_csv("ods_soil_monitor.csv", index=False, encoding="gbk")

# 3. 地块表 ods_farmland（全量表，无分区）
def gen_farmland():
    data = []
    farm_id = 10001  # 地块ID自增，唯一标识
    for city in city_list:
        for year in year_list:
            data.append({
                "farm_id": farm_id,
                "city": city,
                "plant_area": np.random.randint(50, 500),  # 种植面积（亩）
                "crop_name": "玉米",  # 固定作物
                "sow_date": f"{year}-04-20",  # 播种日期（4月下旬）
                "harvest_date": f"{year}-09-20",  # 收获日期（9月下旬）
                "soil_type": "黑土"  # 吉林核心土壤类型
            })
            farm_id += 1  # 每个地块ID唯一
    pd.DataFrame(data).to_csv("ods_farmland.csv", index=False, encoding="gbk")

# 4. 产量表 ods_corn_yield（按年分区）
def gen_yield():
    data = []
    for year in year_list:
        for city in city_list:
            # 产量与种植面积关联：亩产800-1200斤，逻辑合理
            total_area = np.random.randint(10000, 80000)  # 总种植面积（亩）
            mu_yield = round(np.random.uniform(800.0, 1200.0), 1)  # 亩产（斤）
            total_yield = round((total_area * mu_yield) / 2000, 0)  # 总产量（吨，1吨=2000斤）
            data.append({
                "stat_year": year,  # 统计年份
                "city": city,
                "total_plant_area": total_area,
                "total_yield_ton": int(total_yield),  # 转整数，符合业务习惯
                "mu_yield": mu_yield
            })
    pd.DataFrame(data).to_csv("ods_corn_yield.csv", index=False, encoding="gbk")

# 5. 灾害表 ods_pest_disaster（按年分区）
def gen_disaster():
    data = []
    for year in year_list:
        for city in city_list:
            disaster = np.random.choice(disaster_types)
            affected_area = np.random.randint(100, 5000)  # 受灾面积（亩）
            loss_rate = round(np.random.uniform(0.05, 0.30), 2)  # 减产率（5%-30%）
            data.append({
                "stat_year": year,
                "city": city,
                "disaster_type": disaster,
                "affected_area": affected_area,
                "loss_rate": loss_rate
            })
    pd.DataFrame(data).to_csv("ods_pest_disaster.csv", index=False, encoding="gbk")

# 6. 产销表 ods_corn_sale（按日分区，销售期9-11月）
def gen_sale():
    data = []
    for year in year_list:
        for month in [9, 10, 11]:  # 玉米收获后销售期
            for city in city_list:
                # 价格符合近年吉林玉米市场价（2200-2800元/吨）
                price = np.random.randint(2200, 2800)
                sale_ton = np.random.randint(500, 5000)  # 销售量（吨）
                data.append({
                    "dt": f"{year}-{month:02d}-20",  # 日期格式：2020-09-20（每月20日统计）
                    "city": city,
                    "price_per_ton": price,  # 单价（元/吨）
                    "sale_ton_num": sale_ton  # 销售量
                })
    pd.DataFrame(data).to_csv("ods_corn_sale.csv", index=False, encoding="gbk")

# 一键生成所有表（顺序无关，直接运行）
if __name__ == "__main__":
    gen_weather()
    gen_soil()
    gen_farmland()
    gen_yield()
    gen_disaster()
    gen_sale()
    print("✅ 6张GBK编码CSV已生成！")