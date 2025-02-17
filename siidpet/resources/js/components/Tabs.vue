<template>
  <div>
    <!-- Nav tabs -->
    <ul class="tabs">
      <li 
        class="tab" 
        v-for="(tab, index) in tabs" 
        :key="index" 
        :class="{ active: index === activeTab }" 
        @click="setActiveTab(index)"
      >
        {{ tab.label }}
      </li>
    </ul>

    <!-- Tab content -->
    <div class="tab-content">
      <div 
        v-for="(tab, index) in tabs" 
        :key="index" 
        class="tab-pane" 
        :class="{ show: index === activeTab, active: index === activeTab }"
      >
        <slot :name="tab.name"></slot>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Tabs",
  props: {
    tabs: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      activeTab: 0 // Tab activa por defecto
    };
  },
  methods: {
    setActiveTab(index) {
      this.activeTab = index;
    }
  }
};
</script>

<style scoped>
.tabs {
  display: flex;
  border-bottom: 2px solid #ddd;
  margin-bottom: 1rem;
  list-style-type: none;
  padding: 0;
  overflow-x: auto; /* Habilita scroll horizontal */
  white-space: nowrap; /* Evita el salto de línea */
}

.tabs::-webkit-scrollbar {
  height: 8px; /* Tamaño de la barra de scroll */
}

.tabs::-webkit-scrollbar-thumb {
  background: #ccc; /* Color del pulgar del scroll */
  border-radius: 4px;
}

.tabs::-webkit-scrollbar-thumb:hover {
  background: #999;
}

.tab {
  padding: 10px 20px;
  cursor: pointer;
  font-weight: 500;
  text-align: center;
  color: #555;
  transition: color 0.3s ease, border-bottom 0.3s ease;
  border-bottom: 3px solid transparent;
}

.tab:hover {
  color: #007bff;
}

.tab.active {
  color: #007bff;
  border-bottom: 3px solid #007bff;
}

.tab-content {
  margin-top: 20px;
}

.tab-pane {
  display: none;
  animation: fadeIn 0.3s ease;
}

.tab-pane.show.active {
  display: block;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
</style>
