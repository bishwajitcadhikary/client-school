import{aH as c,c as V,w as a,r as b,o as k,a as e,f as i,t as u,aI as _,u as l,ap as y,J as C,V as g}from"./app.dfca5287.js";import B from"./SettingsDrawerContent.c7703bac.js";import{V as v,c as S,a as $,e as F}from"./VCard.1aef212d.js";import{V as T}from"./VForm.871c80d0.js";import{V as w}from"./VCol.4592c862.js";import{V as n}from"./VSelect.7afc3e43.js";import"./VCheckboxBtn.134247d4.js";import"./VChip.7123b1f9.js";const I={__name:"Create",props:{disks:{type:Object,default:null}},setup(d){const t=c({backup_type:"full",file_disk_id:null}),m=[{title:"Full",value:"full"},{title:"Only DB",value:"only-db"},{title:"Only Files",value:"only-files"}];function p(){t.post(route("admin.settings.backups.store"))}return(s,o)=>{const f=b("AdminLayout");return k(),V(f,{title:s.$t("Create Backup"),back:s.route("admin.settings.file-disks.index")},{"sub-navbar":a(()=>[e(B)]),default:a(()=>[e(g,null,{default:a(()=>[e(v,null,{default:a(()=>[e(S,null,{default:a(()=>[i(u(s.$t("Create Backup")),1)]),_:1}),e(T,{onSubmit:_(p,["prevent"])},{default:a(()=>[e($,null,{default:a(()=>[e(w,{cols:"12"},{default:a(()=>[e(n,{modelValue:l(t).backup_type,"onUpdate:modelValue":o[0]||(o[0]=r=>l(t).backup_type=r),label:s.$t("Backup Type"),items:m,"error-messages":l(t).errors.backup_type,class:"mb-12",autofocus:""},null,8,["modelValue","label","error-messages"]),e(n,{modelValue:l(t).file_disk_id,"onUpdate:modelValue":o[1]||(o[1]=r=>l(t).file_disk_id=r),label:s.$t("Backup Disk"),items:d.disks,"error-messages":l(t).errors.file_disk_id},null,8,["modelValue","label","items","error-messages"])]),_:1})]),_:1}),e(F,null,{default:a(()=>[e(y),e(C,{type:"submit",loading:l(t).processing},{default:a(()=>[i(u(s.$t("Submit")),1)]),_:1},8,["loading"])]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{I as default};