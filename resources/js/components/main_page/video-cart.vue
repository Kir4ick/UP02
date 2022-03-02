<template>
    <div @click ='redirect(video.id)' class="content_cart">
        <img :src="'../storage/'+video.preview" alt="">
        <div class="info_cart">
            <div class="avatar_user">
                <h3>{{video.nickname}}</h3>
                <img :src="'../storage/'+video.avatar" alt="">
            </div>
            <div class="text_info">
                <h2>{{video.title_video}}</h2>
                <p>{{video.description_video}}</p>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "video-cart",
    props:{
        video:{
            type: Object
        }
    },
    methods:{
        redirect(id){
            this.$router.push({name: 'video', params:{id:id}})
        }
    }
}
</script>

<style scoped>

</style>
