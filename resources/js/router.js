import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

import mainPage from './components/main_page/main-content';
import profile from './components/profile/profile'
import adminPanel from "./components/admin/adminPanel";
import videoPage from "./components/video/video-page";

const router = [
    {path: '/', component: mainPage},
    {path: '/me', component: profile },
    {path: '/admin', component: adminPanel},
    {path: '/:id', component: videoPage, name: 'video'}
]
export default new VueRouter({
    mode: "history",
    routes: router
});
