<template>
  <div id="app" class="container mt-5">
    <div class="nav-tabs-wrapper">
      <!-- Botón para desplazar a la izquierda -->
      <button class="scroll-btn scroll-left" @click="scrollTabs(-100)">
        &#10094;
      </button>
  
      <!-- Pestañas con scroll -->
      <div class="nav-tabs-container" ref="tabsContainer">
        <ul class="nav nav-tabs" role="tablist">
          <li v-for="(tab, index) in tabs" :key="index" class="nav-item">
            <a :class="['nav-link', { active: activeTab === index }]" @click="setActiveTab(index)">
              {{ tab }}
            </a>
          </li>
        </ul>
      </div>
  
      <!-- Botón para desplazar a la derecha -->
      <button class="scroll-btn scroll-right" @click="scrollTabs(100)">
        &#10095;
      </button>
    </div>
  
    <!-- Contenido de las pestañas -->
    <div class="tab-content mt-3">
      <div v-for="(content, index) in tabContents" :key="index" v-show="activeTab === index">
        {{ content }}
      </div>
    </div>
  </div>
  </template>
  
  <script>
  import VueApexCharts from 'vue3-apexcharts';
  
  export default {
    components: {
      apexchart: VueApexCharts
    },
    data() {
      return {
        activeTab: 0, // índice de la pestaña activa
        tabs: ['Entrevista', 'Imputado', 'Delito', 'Víctima', 'Flagrancia', 'Determinación MP','OPC1','OPC2','OPC3','OPC4','OPC5','OPC6','OPC7','OPC8','OPC9'], // nombres de las pestañas
        tabContents: [
          'Contenido de la Entrevista',
          'Contenido del Imputado',
          'Contenido del Delito',
          'Contenido de la Víctima',
          'Contenido de la Flagrancia',
          'Contenido de la Determinación MP',
          'OPC1',
          'OPC2',
          'OPC3',
          'OPC4',
          'OPC5',
        ] // contenido de cada pestaña
      };
    },
    methods: {
      setActiveTab(index) {
        this.activeTab = index;
      },
      scrollTabs(distance) {
        const container = this.$refs.tabsContainer;
        container.scrollBy({
          left: distance,
          behavior: 'smooth'
        });
      }
    }
  };
  </script>
  
  <style scoped>
  .nav-tabs-wrapper {
    display: flex;
    align-items: center;
    position: relative;
  }
  .nav-tabs-container {
    overflow-x: auto;
    white-space: nowrap;
    flex-grow: 1;
  }
  .nav-tabs-container::-webkit-scrollbar {
    display: none;
  }
  .scroll-btn {
    background: none;
    border: none;
    font-size: 20px;
    cursor: pointer;
    padding: 10px;
    position: absolute;
    top: 0;
    bottom: 0;
    z-index: 1;
  }
  .scroll-left {
    left: 0;
  }
  .scroll-right {
    right: 0;
  }
  </style>
  