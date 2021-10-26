# googlefit_apple_test

apple health로부터 사용자 정보를 불러오는 package입니다.
45줄의 주석처리된 코드를 이용해 필요한 정보를 불러올 수 있으며,
스트레스 계산에는 HEART_RATE_VARIABILITY_SDNN과 HEART_RATE데이터가 이용됩니다.

스트레스 계산식은 86줄부터 110줄까지의 계산식으로, 심박수에서 HRV*0.3을 뺀 값입니다.
현재 이 값은 시간, 스트레스 지수의 List<Pair>형태로 제공됩니다.