import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

import test from './components/test';

const router = [
    {path: '/registration', component: test}
]
export default new VueRouter({
    mode: "history",
    routes: router
});
