import m from"./AccountSettingsAccount.191d871e.js";import d from"./AccountSettingsSecurity.8d9fc1a8.js";import{a as p,V as f,c as n,b as y}from"./VWindowItem.45e2222f.js";import{r as b,c as V,w as r,b as v,o as u,d as e,av as g,aw as A,p as w,f as q,g as T,M as j,aK as k}from"./app.75fe97d5.js";import"./rules.e0338894.js";import"./filepond-plugin-image-preview.min.b08d6b38.js";import"./VRow.1decdef7.js";/* empty css              */import"./VForm.36860c1c.js";import"./VCol.73001860.js";import"./VSelect.0dade002.js";import"./VCheckboxBtn.47b8d0ed.js";import"./VSelectionControl.7a610615.js";import"./VChip.d1149a3f.js";import"./VAlert.6eca066d.js";import"./VCheckbox.1b2c2514.js";const Z={__name:"Index",props:{customer:{type:Object,required:!0},languages:{type:[Array,Object],required:!0},countries:{type:[Array,Object],required:!0},currencies:{type:[Array,Object],required:!0},timeZones:{type:[Array,Object],required:!0},confirmsTwoFactorAuthentication:{type:Boolean,default:null},sessions:{type:Array,default:null}},setup(a){const o=b(null),s=[{title:"Account",icon:"mdi-account-outline",tab:"account"},{title:"Security",icon:"mdi-lock-open-outline",tab:"security"}];return(l,i)=>{const c=v("AppLayout");return u(),V(c,{title:l.$t("Profile")},{default:r(()=>[e(f,{modelValue:o.value,"onUpdate:modelValue":i[0]||(i[0]=t=>o.value=t),"show-arrows":""},{default:r(()=>[(u(),g(j,null,A(s,t=>e(p,{key:t.icon,value:t.tab},{default:r(()=>[e(w,{size:"20",start:"",icon:t.icon},null,8,["icon"]),q(" "+T(t.title),1)]),_:2},1032,["value"])),64))]),_:1},8,["modelValue"]),e(k),e(y,{modelValue:o.value,"onUpdate:modelValue":i[1]||(i[1]=t=>o.value=t),class:"mt-5 disable-tab-transition",touch:!1},{default:r(()=>[e(n,{value:"account"},{default:r(()=>[e(m,{customer:a.customer,languages:a.languages,countries:a.countries,currencies:a.currencies,"time-zones":a.timeZones,"requires-confirmation":a.confirmsTwoFactorAuthentication},null,8,["customer","languages","countries","currencies","time-zones","requires-confirmation"])]),_:1}),e(n,{value:"security"},{default:r(()=>[e(d)]),_:1})]),_:1},8,["modelValue"])]),_:1},8,["title"])}}};export{Z as default};