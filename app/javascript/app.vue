<template>
<div id="app">
<p>{{ message }}</p>
</div>
</template>
<template>
<div id="app">
<v-app>
<p>{{ message }}</p>
<player/>
</v-app>
</div>
</template>
<script>
import player from "packs/components/player.vue";
export default {
data: function() {
        return {
message: "Hello G.!"
        };
      },
components: {
player: player
            }
};
</script>
<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
