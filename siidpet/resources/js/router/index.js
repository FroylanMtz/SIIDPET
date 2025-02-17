import { createRouter, createWebHistory} from 'vue-router'
import Home from '../components/Home.vue'
import Usuarios from '../components/Usuarios.vue'
import nsjpao from '../components/NSJPAO.vue'
import NUC from '../components/ExpedienteImputado.vue'
import PaginaNoEncontrada from  '../components/PaginaNoEncontrada.vue'
import verNuc from  '../components/verNuc.vue'
import ExpedienteImputado from  '../components/ExpedienteImputado.vue'
import AccesoDenegado from '../components/PaginaDenegada.vue'
import Permisos from '../components/Permisos.vue';
import Peticionarios from '../components/Peticionarios.vue';
import reportesNSJPAO from '../components/reportesNSJPAO.vue';
import calendario from '../components/Calendario.vue';
import CuentaDiaria from '../components/CuentaDiaria.vue';
import Defensores from '../components/admin/Defensores.vue';
import UGI from '../components/admin/UGI.vue';
import Expedientes from '../components/defensor/Expedientes.vue';
import verExpediente from '../components/defensor/VerExpediente.vue';
import Delito from '../components/admin/Delito.vue';
import MedidasProteccion from '../components/admin/MedidasProteccion.vue';
import Juez from '../components/admin/Juez.vue';
import Medidas from '../components/admin/Medidas.vue';

import Coordinaciones from '../components/admin/Coordinaciones.vue';

import TribunalEnjuiciamiento from '../components/admin/TribunalEnjuiciamiento.vue';

import Test from '../components/defensor/componentes/CmpTestChart.vue';
const routes = [
    {
        path: '/',
        name: 'home',
        component: Home
    },
    {
        path: '/usuarios',
        name: ' ',
        component: Usuarios,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    {
        path: '/denegado',
        name: 'denegado',
        component: AccesoDenegado
    },
    { 
        path: '/nsjpao',
        name: 'nsjpao',
        component: nsjpao,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    { 
        path: '/nuc',
        name: 'nuc',
        component: NUC,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    { 
        path: '/nuc/ver/:NUC',
        name: 'verNuc',
        component: verNuc,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    { 
        path: '/nuc/ExpedienteImputado/:inputado',
        name: 'ExpedienteImputado',
        component: ExpedienteImputado,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    { 
        path: '/permisos',
        name: 'Permisos',
        component: Permisos,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    { 
        path: '/peticionarios',
        name: 'Peticionarios',
        component: Peticionarios,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    { 
        path: '/reportesNSJPAO',
        name: 'reportesNSJPAO',
        component: reportesNSJPAO,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    { 
        path: '/calendario',
        name: 'calendario',
        component: calendario,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    
    {
        path: "/registrar/cuentadiaria",
        name: "CuentaDiaria",
        component: CuentaDiaria,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    {
        path: "/Catalogos",
        name: "Catalogos",
        component: CuentaDiaria,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    {
        path: "/defensores",
        name: "Defensores",
        component: Defensores,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
 
    {
        path: "/UGI",
        name: "UGI",
        component: UGI,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
 
    {
        path: "/expedientes",
        name: "expedientes",
        component: Expedientes,
        meta: { requiresAuth: true, requiresD: true }
    },

    {
        path: "/expedientes/:id",
        name: "verExpedientes",
        component: verExpediente,
        meta: { requiresAuth: true, requiresD: true }
    },
    {
        path: "/Delito",
        name: "Delito",
        component: Delito,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    {
        path: "/Juez",
        name: "Juez",
        component: Juez,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    {
        path: "/MedidasProteccion",
        name: "MedidasProteccion",
        component: MedidasProteccion,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
    {
        path: "/Medidas",
        name: "Medidas",
        component: Medidas,
        meta: { requiresAuth: true, requiresAdmin: true }
    },

    {
        path: "/Coordinaciones",
        name: "Coordinaciones",
        component: Coordinaciones,
        meta: { requiresAuth: true, requiresAdmin: true }
    },


    {
        path: "/Tribunal",
        name: "Tribunal",
        component: TribunalEnjuiciamiento,
        meta: { requiresAuth: true, requiresAdmin: true }
    },


    {
        path: "/testgraf",
        name: "testgraf",
        component: Test,
        meta: { requiresAuth: true, requiresAdmin: true }
    },

    {
        path: "/:catchAll(.*)",
        name: "NotFound",
        component: PaginaNoEncontrada,
        meta: { requiresAuth: true, requiresAdmin: true }
    },
];

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes
});

/*
router.beforeEach((to, from, next) => {
    
    const rol = window.rol;
    const isAdmin = (rol == 1) ? true : false;
    const isDG = (rol == 2) ? true : false;
    const isDD = (rol == 3) ? true : false;
    const isDA = (rol == 4) ? true : false;
    const isJA = (rol == 5) ? true : false;
    const isD = (rol == 6) ? true : false;
    const isA = (rol == 7) ? true : false;

    if(rol == undefined ){
        next('/login');
        console.log( from );
    }

    if (to.meta.requiresAdmin && !isAdmin) {
        next('/denegado');
    } else if (to.meta.requiresDG && !isDG) {
        next('/denegado');
    } else if (to.meta.requiresDD && !isDD) {
        next('/denegado');
    } else if (to.meta.requiresDA && !isDA) {
        next('/denegado');
    } else if (to.meta.requiresJA && !isJA) {
        next('/denegado');
    } else if (to.meta.requiresD && !isD) {
        next('/denegado');
    } else if (to.meta.requiresA && !isA) {
        next('/denegado');
    } else {
        next();
    }
    
    const baseUrl = "/" + to.fullPath.split('/')[1]
    let permitirAcceso = false;
    for (let index = 0; index < window.permisosSession.length; index++) {
        const permiso = window.permisosSession[index];
        if( baseUrl === permiso.ruta ){
            permitirAcceso = true;
        }
    }

    if( permitirAcceso || to.fullPath === '/denegado' || to.fullPath === '/permisos' ){
        next();
    }else{
        next('/denegado');
    }

    console.log("ROL");
    console.log( window.rol );
    next();
    

});
*/

export default router;