<template>
  <v-data-table
    :headers="headers"
    :items="players"
    sort-by="calories"
    class="elevation-1"
  >
    <template v-slot:top>
      <v-toolbar
        flat
      >
        <v-toolbar-title>Players:</v-toolbar-title>
        <v-divider
          class="mx-4"
          inset
          vertical
        ></v-divider>
        <v-spacer></v-spacer>
        <v-dialog
          v-model="dialog"
          max-width="500px"
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              color="primary"
              dark
              class="mb-2"
              v-bind="attrs"
              v-on="on"
            >
              New Player
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="headline">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.name"
                      label="Player name"
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.nickname"
                      label="Nickname"
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.email"
                      label="Email"
                    ></v-text-field>
                  </v-col>

                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-switch
                      v-model="editedItem.activated"
                      :label="`Activated?: ${editedItem.activated.toString()}`"
                    ></v-switch>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn
                color="blue darken-1"
                text
                @click="close"
              >
                Cancel
              </v-btn>
              <v-btn
                color="blue darken-1"
                text
                @click="save(editedItem)"
              >
                Save
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template v-slot:item.actions="{ item }">
      <v-icon small class="mr-2" @click="editItem(item)">
        edit
      </v-icon>
      <v-icon small @click="deleteItem(item)">
        delete
      </v-icon>
    </template>
    <template v-slot:no-data>
      <v-btn color="primary" @click="initialize">
        Reset
      </v-btn>
    </template>
  </v-data-table>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
    dialog: false,
    headers: [
      {
        text: 'Players name',
        align: 'start',
        sortable: false,
        value: 'name',
      },
      { text: 'Nickname', value: 'nickname' },
      { text: 'Email:', value: 'email' },
      { text: 'Enabled:', value: 'activated' },
      { text: 'Actions', value: 'actions', sortable: false },
    ],
    players: [],
    editedIndex: -1,
    editedItem: {
      name: '',
      nickname: '',
      email: '',
      activated: true,
    },
    defaultItem: {
      name: '',
      nickname: '',
      email: '',
      activated: true,
    },
  }),

  computed: {
    formTitle () {
      return this.editedIndex === -1 ? 'New Player' : 'Edit Player'
    }
  },

  watch: {
    dialog (val) {
      val || this.close()
    },
  },

  created () {
    this.initialize()
  },

  methods: {

    close () {
      this.dialog = false
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem)
        this.editedIndex = -1
      }, 300)
    },

    initialize () {
      return axios
        .get("http://localhost:3000/players")
        .then(response => {
          console.log(response.data);
          this.players = response.data;
        })
        .catch(e => {
          console.log(e);
        });
    },

    getPlayer(item) {
      axios.get(`http://localhost:3000/players/${item.id}`)
        .then(response => {
          this.player = response.data;
        })
        .catch(error => {
          console.log(error)
        })
    },

    editItem(item) {
      this.editedIndex = item.id;
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },

    save(item) {
      if (this.editedIndex > -1) {
        axios
          .put(`http://localhost:3000/players/${item.id}`, {
            id: this.editedItem.id,
            name: this.editedItem.name,
            nickname: this.editedItem.nickname,
            email: this.editedItem.email,
            activated: this.editedItem.activated
          })
          .then(response => {
            console.log(response);
            this.initialize();
          })
          .catch(error => {
            console.log(error);
          });
      }
      else
      {
        axios
          .post("http://localhost:3000/players/", {
            player: this.editedItem
          })
          .then(response => {
            console.log(response);
            console.log("Created!");
            this.initialize();
          })
          .catch(error => {
            console.log(error);
          });
      }
      this.close();
    },

    deleteItem(item) {
      const index = this.players.indexOf(item);
      confirm("Are you sure you want to delete this item?");
      axios
        .delete(`http://localhost:3000/players/${item.id}`)
        .then(response => {
          console.log(response);
          console.log(response.data.json);
          alert(response.data.json);
          this.initialize();
        })
        .catch(error => {
          console.log(error);
        });
      this.plaers.splice(index, 1);
    }
  }
}
</script>
