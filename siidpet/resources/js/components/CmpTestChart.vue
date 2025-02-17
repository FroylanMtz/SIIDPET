<template>
  <div>
    <apexchart 
      type="line" 
      height="400" 
      :options="chartOptions" 
      :series="series"
    />
  </div>
</template>

<script>
import ApexCharts from "apexcharts";
import VueApexCharts from "vue3-apexcharts";

export default {
  name: "LineChartExample",
  components: {
    apexchart: VueApexCharts,
  },
  data() {
    return {
      // Opciones del gráfico
      chartOptions: {
        chart: {
          id: "ventas-chart",
        },
        xaxis: {
          categories: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio"],
        },
        title: {
          text: "Expedientes por mes",
          align: "center",
        },
      },
      // Datos para el gráfico
      series: [
        {
          name: "Ventas",
          data: [10, 41, 35, 51, 49, 62, 69],
        },
      ],
    };
  },
};
</script>
