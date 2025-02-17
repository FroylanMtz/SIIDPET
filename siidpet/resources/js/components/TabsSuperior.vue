<template>
  <div>
    <!-- Nav tabs -->
    <ul class="nav nav-tabs">
      <li class="nav-item" v-for="(tab, index) in tabs" :key="index">
        <button
          class="nav-link"
          :class="{ active: index === activeTab }"
          @click="setActiveTab(index)"
        >
          {{ tab.label }}
        </button>
      </li>
    </ul>

    <!-- Tab content -->
    <div class="tab-content mt-3">
      <div
        v-for="(tab, index) in tabs"
        :key="index"
        class="tab-pane fade"
        :class="{ show: index === activeTab, active: index === activeTab }"
      >
        <slot :name="tab.name" />
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
      required: true,
    },
  },
  data() {
    return {
      activeTab: 0, // Tab activa por defecto
    };
  },
  methods: {
    setActiveTab(index) {
      this.activeTab = index;
    },
  },
};
</script>

<style scoped>
.nav-tabs .nav-link {
  border-radius: 0.5rem 0.5rem 0 0;
  transition: background-color 0.3s ease;
}
.nav-tabs .nav-link.active {
  background-color: #007bff;
  color: white;
}
</style>
