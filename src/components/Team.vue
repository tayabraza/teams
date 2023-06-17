<template>
    <h2>Team {{ team }} Information</h2>
    <div class="table-responsive">
        <table class="table table-striped text-start">
            <thead>
                <tr>
                    <th>S No.</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Car Reg</th>
                    <th>Contact</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(member, index) in teamsMembers[teamNumber]" :key="member.id">
                    <td width="10%" contenteditable="false">{{ index + 1}}</td>
                    <td width="15%">{{ member.id }}</td>
                    <td width="25%">{{ member.name }}</td>
                    <td width="25%">{{ member.carReg }}</td>
                    <td width="25%">{{ member.contact }}<span v-if="currentURL.includes('teams')" :id="member.id" style="float: right;font-size: 20px;" contenteditable="false"><i class="fa fa-check text-success d-none" @click="EditMemberConfirm($event)"></i><i class="fa fa-pencil text-primary" @click="EditMember($event)"></i>&nbsp;<i class="fa fa-trash text-danger" @click="deleteMember($event)"></i></span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <form id="teamsForm">
        <div class="row my-2">
            <div class="col-md my-3">
                <input type="hidden" v-model="team" name="team" />
                <input type="tel" v-model="id" name="id" placeholder="ID (5 digits)" class="form-control" maxlength="5" onkeyup="this.value = this.value.replace(/\D+/, '')" required />
            </div>
            <div class="col-md my-3">
                <input type="text" v-model="name" name="name" placeholder="Name" class="form-control" required />
            </div>
            <div class="col-md my-3">
                <input type="text" v-model="car" name="carReg" placeholder="Car Reg" class="form-control" required />
            </div>
            <div class="col-md my-3">
                <input type="tel" v-model="contact" name="contact" placeholder="Contact Number" class="form-control" maxlength="11" onkeyup="this.value = this.value.replace(/\D+/, '')" required />
            </div>
        </div>
        <div class="row">
            <div class="col-md text-center mb-3">
                <button type="button" class="btn btn-success" @click="addMember">Add New Member</button>
            </div>
        </div>
    </form>
    <div class="modal" id="delModal">
        <div class="modal-dialog">
            <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">Confirmation</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <p class="text-center">Are you sure you want to delete ID <strong><sapn class="text-danger"> "{{ teamsId }}"</sapn></strong>?</p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger" @click="deleteMemberConfirm">Yes, I am sure</button>
            </div>

            </div>
        </div>
    </div> 
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">Confirmation</h4>
                <button type="button" class="btn-close" onclick="location.reload()"></button>
            </div>

            <div class="modal-body">
                <h5 class="text-center text-success">{{teamsName}} has been added successfully!</h5>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="location.reload()">Close</button>
            </div>

            </div>
        </div>
    </div>
</template>

<script setup>

    import { ref, } from 'vue'

    const teamsMembers = defineProps({
        team1: Array,
        team2: Array,
        team3: Array,
        team4: Array,
        team5: Array,
        team6: Array,
        team7: Array,
        team8: Array,
        teamNumber: String
    });

    let currentURL = ref(window.location.href);
    let teamsId = ref("");
    let teamsName = ref("");

    let id = ref('');
    let name = ref('');
    let car = ref('');
    let contact = ref('');
    let team = ref(teamsMembers.teamNumber.replace(/\D+/, ''))

    let idOld = ref('');
    let nameOld = ref('');
    let carOld = ref('');
    let contactOld = ref('');

    function addMember(){

        teamsName.value = name.value;

        const formData = {
            ID: id.value,
            Name: name.value,
            Car: car.value,
            Contact: contact.value,
            Team: team.value
        }
        const url = "/teams/database/db_create.php";
        const options = {
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(formData)
        }

        fetchReq(url, options)

        const myModal = new bootstrap.Modal(document.getElementById("myModal"));

        myModal.show();

        id.value = "";
        name.value = "";
        car.value = "";
        contact.value = "";

    }

    const delModal = ref("");

    function deleteMember(event){

        teamsId.value = event.currentTarget.parentNode.id;

        delModal.value = new bootstrap.Modal(document.getElementById("delModal"));

        delModal.value.show();

    }

    function deleteMemberConfirm(){

        let deletedRow = document.getElementById(teamsId.value).parentNode.parentNode;
        deletedRow.querySelectorAll('td')[1].innerText;

        const deletedData = {
            ID: deletedRow.querySelectorAll('td')[1].innerText,
            Name: deletedRow.querySelectorAll('td')[2].innerText,
            Car: deletedRow.querySelectorAll('td')[3].innerText,
            Contact: deletedRow.querySelectorAll('td')[4].innerText,
            Team: team.value
        };

        const url = "/teams/database/db_delete.php";
        const options = {
            method: "DELETE",
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(deletedData)
        }

        fetchReq(url, options)

        delModal.value.hide();

        document.getElementById(teamsId.value).parentNode.parentNode.remove();

    }

    function EditMember(event){

        event.currentTarget.classList.add('d-none');
        event.currentTarget.previousElementSibling.classList.remove('d-none');

        let self = event.currentTarget.parentElement.parentElement.parentElement;
        self.setAttribute("contenteditable", true)
        self.style.border = "2px solid";

        idOld.value = self.querySelectorAll('td')[1].innerText;
        nameOld.value = self.querySelectorAll('td')[2].innerText;
        carOld.value = self.querySelectorAll('td')[3].innerText;
        contactOld.value = self.querySelectorAll('td')[4].innerText;

    }

    function EditMemberConfirm(event){

        event.currentTarget.classList.add('d-none');
        event.currentTarget.nextElementSibling.classList.remove('d-none');

        let self = event.currentTarget.parentElement.parentElement.parentElement;
        self.setAttribute("contenteditable", false)
        self.style.border = "none";

        const editedData = {
            ID: self.querySelectorAll('td')[1].innerText.trim().slice(0,5).replace(/\D+/, ''),
            ID_Old: idOld.value,
            Name: self.querySelectorAll('td')[2].innerText.trim().slice(0,30).replace(/\d+/, ''),
            NameOld: nameOld.value,
            Car: self.querySelectorAll('td')[3].innerText.trim().slice(0,10).replace(/[^a-zA-Z0-9 ]/g, '').trim(),
            CarOld: carOld.value,
            Contact: self.querySelectorAll('td')[4].innerText.trim().slice(0,11).replace(/\D+/, ''),
            ContactOld: contactOld.value.trim(),
            Team: team.value
        }

        const url = "/teams/database/db_update.php";
        const options = {
            method: "PUT",
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(editedData)
        }

        fetchReq(url, options)
    }

    function fetchReq(url, options){

        fetch(url, options)
        .then(response => response.json())
        .then(data => {
            console.log(data);
        })
        .catch(error => {
            console.error(error);
        });
    }

</script>