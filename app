import streamlit as st
import math
import matplotlib.pyplot as plt

# 페이지 설정
st.set_page_config(page_title="유클리드 거리 계산기", page_icon="📏")

st.title("📏 선 길이 계산기 (Euclidean Distance)")
st.write("시작점과 끝점의 좌표를 입력하여 선을 그리고 길이를 계산합니다.")

# 사이드바 혹은 메인 화면에서 좌표 입력 받기
col1, col2 = st.columns(2)

with col1:
    st.subheader("시작점 (Start Point)")
    x1 = st.number_input("X1 좌표", value=0.0, step=1.0)
    y1 = st.number_input("Y1 좌표", value=0.0, step=1.0)

with col2:
    st.subheader("끝점 (End Point)")
    x2 = st.number_input("X2 좌표", value=10.0, step=1.0)
    y2 = st.number_input("Y2 좌표", value=10.0, step=1.0)

# 유클리드 거리 계산
distance = math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

# 결과 표시
st.divider()
st.metric(label="계산된 거리 (Distance)", value=f"{distance:.4f}")

# 시각화 (Matplotlib 사용)
fig, ax = plt.subplots()

# 선 그리기
ax.plot([x1, x2], [y1, y2], marker='o', color='b', label='Line')

# 텍스트로 거리 표시
mid_x = (x1 + x2) / 2
mid_y = (y1 + y2) / 2
ax.text(mid_x, mid_y, f'{distance:.2f}', fontsize=12, color='red', ha='center', va='bottom')

# 그래프 설정
ax.set_title("Line Visualization")
ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.grid(True)
ax.legend()
ax.set_aspect('equal', adjustable='box') # 비율 유지

# Streamlit에 그래프 표시
st.pyplot(fig)