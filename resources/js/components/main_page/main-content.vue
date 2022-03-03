<template>
    <main>
        <div class="main">
            <div class="content_carts">
                <video_cart
                    v-for="video in content"
                    :key = "video.id"
                    v-bind:video = "video"
                ></video_cart>
                <div class="loader">

                </div>
            </div>
        </div>
    </main>
</template>

<script>
import video_cart from './video-cart';

export default {
    name: "main_page",
    components:{
        video_cart
    },
    data(){
        return{
          content:[],
            offset: 0
        }
    },
    mounted(){
        document.body.style.paddingTop = 400 + 'px';
        document.body.style.background = 'url("../img/background.jpg")';
        document.body.style.backgroundAttachment = 'fixed';
        document.body.style.backgroundRepeat = 'no-repeat';
        document.body.style.backgroundSize = 'cover';
        document.body.style.backgroundPositionY = -150 + 'px';
        this.loadScroll();
        axios.get('api/videos/' + this.offset).
        then(response => {this.content.push(...response.data)});
    },
    methods:{
        loadScroll(){
            const loader = new IntersectionObserver(entries =>{
                entries.forEach(entry=>{
                    if (entry.isIntersecting) {
                        if (this.offset > 100) {
                            return;
                        }
                        setTimeout(() => {
                            this.offset += 10;
                            axios.get('api/videos/' + this.offset).
                            then(response => {this.content.push(...response.data)});
                        }, 1000)
                    }
                })
            });
            loader.observe(document.querySelector('.loader'));
        }
    }
}
</script>

<style scoped>

</style>
