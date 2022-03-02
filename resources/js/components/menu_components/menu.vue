<template>
    <div class="menu_wrapper">
        <ul>
            <router-link to="/"><li>Главная</li></router-link>
            <router-link to="me"><li>Аккаунт</li></router-link>
            <router-link to="likes"><li>Понравившиеся</li></router-link>
            <router-link to="category"><li>Игры</li></router-link>
        </ul>
    </div>
</template>

<script>

export default {
    name: "menu-component",
    props:{

    }
}
</script>

<style>
.fade-enter-active ul, .fade-leave-active ul {
    transition: opacity 1s ease;
}

.fade-enter ul, .fade-leave-to ul{
    opacity: 0;
}

.fade-enter-active, .fade-leave-active {
    transition: height 2s ease;
}
.fade-enter, .fade-leave-to{
    height: 0px;
}
</style>
