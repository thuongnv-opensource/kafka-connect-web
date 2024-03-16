import Vue from 'vue'
import App from './App.vue'
import VueRouter from "vue-router";

import PipelineList from './components/PipelineList.vue';
import PipelineAdd from './components/PipelineAdd.vue';
import PipelineDetail from './components/PipelineDetail.vue';
import ConnectStatus from './components/ConnectStatus.vue';
import ConnectWebHome from './components/ConnectWebHome.vue';

Vue.use(VueRouter);

const connectCluster = process.env.VUE_APP_CONNECT_SERVERS != null ?
    process.env.VUE_APP_CONNECT_SERVERS : "http://localhost:8083";
Vue.prototype.$connectServerList = connectCluster.indexOf(',') > -1 ?
    connectCluster.split(',') : [connectCluster]

const router = new VueRouter({
    routes: [
        {path: '/', component: ConnectWebHome},
        {path: '/PipelineList', name: 'PipelineList', component: PipelineList},
        {path: '/PipelineAdd', name: 'PipelineAdd', component: PipelineAdd},
        {path: '/PipelineDetail', name: 'PipelineDetail', component: PipelineDetail, props: true},
        {path: '/ConnectStatus', name: 'ConnectStatus', component: ConnectStatus},
        {path: '*', component: ConnectWebHome}
    ]
});

Vue.config.productionTip = false

new Vue({
    router,
    render: h => h(App),
}).$mount('#app')
