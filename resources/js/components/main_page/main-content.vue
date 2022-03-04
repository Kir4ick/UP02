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
        let width = document.body.clientWidth;
        width = (0.012 * width);
        document.body.style.paddingTop = 25 + 'vh';
        document.body.style.background = 'url("../img/background.jpg")';
        document.body.style.backgroundAttachment = 'fixed';
        document.body.style.backgroundRepeat = 'no-repeat';
        document.body.style.backgroundSize = 100 + '%';
        document.body.style.backgroundPositionY = -5 * width  + 'px';
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
                            then(response => {
                                if(response.data === []){
                                    return;
                                }else{
                                    this.content.push(...response.data)
                                }
                            });
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
