import{a as u,c as d,w as e,r as f,o as p,b as t,V,g as _,h as c,j as b,i as r,k as g,e as C,t as k}from"./app.dc2d0110.js";import w from"./SettingsDrawerContent.467232ae.js";import{V as y}from"./VRow.12f67658.js";import{V as s}from"./VCol.e64a4a91.js";import{V as S}from"./VForm.25e51c80.js";import{V as $}from"./VContainer.ae849916.js";import"./VSelect.1c594559.js";import"./VCheckboxBtn.8dc877ea.js";import"./VChip.3dfe68ed.js";/* empty css              */const D={__name:"Create",setup(v){const o=u({name:null});function n(){o.post(route("admin.settings.roles.store"))}return(a,l)=>{const m=f("AdminLayout");return p(),d(m,{title:a.$t("Create Role"),back:a.route("admin.settings.roles.index")},{"sub-navbar":e(()=>[t(w)]),default:e(()=>[t($,null,{default:e(()=>[t(y,null,{default:e(()=>[t(s,{cols:"12",sm:"6"},{default:e(()=>[t(V,null,{default:e(()=>[t(_,null,{default:e(()=>[t(S,{onSubmit:c(n,["prevent"])},{default:e(()=>[t(s,{cols:"12"},{default:e(()=>[t(b,{modelValue:r(o).name,"onUpdate:modelValue":l[0]||(l[0]=i=>r(o).name=i),label:a.$t("Name"),"error-messages":r(o).errors.name,outlined:"",dense:""},null,8,["modelValue","label","error-messages"])]),_:1}),t(s,{cols:"12"},{default:e(()=>[t(g,{loading:r(o).processing,type:"submit",block:""},{default:e(()=>[C(k(a.$t("Submit")),1)]),_:1},8,["loading"])]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{D as default};
