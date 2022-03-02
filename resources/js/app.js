
require('./bootstrap');
require('jquery');


window.Vue = require('vue');

// Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('test', require('./components/test.vue').default);
Vue.component('header-component', require('./components/header.vue').default);
Vue.component('main-component', require('./components/main_page/main-content').default);
Vue.component('profile', require('./components/profile/profile').default);

import router from './router';

const app = new Vue({
    el: '#app',
    router: router
});
