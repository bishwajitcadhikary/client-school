import{a as u,c as d,w as e,b as p,o as f,d as t,V,i as _,j as c,l as b,k as s,n as g,f as C,g as k}from"./app.fc5e7aab.js";import w from"./SettingsDrawerContent.41930670.js";import{V as y}from"./VRow.0c101af0.js";import{V as r}from"./VCol.48b6b065.js";import{V as S}from"./VForm.c3f8aaed.js";import{V as $}from"./VContainer.88b2197d.js";import"./VSelect.9d034a32.js";import"./VCheckboxBtn.b3459cab.js";import"./VSelectionControl.ef57def4.js";/* empty css              */const D={__name:"Create",setup(v){const o=u({name:null});function n(){o.post(route("admin.settings.roles.store"))}return(a,l)=>{const m=p("AppLayout");return f(),d(m,{title:a.$t("Create Role"),back:a.route("admin.settings.roles.index")},{"sub-navbar":e(()=>[t(w)]),default:e(()=>[t($,null,{default:e(()=>[t(y,null,{default:e(()=>[t(r,{cols:"12",sm:"6"},{default:e(()=>[t(V,null,{default:e(()=>[t(_,null,{default:e(()=>[t(S,{onSubmit:c(n,["prevent"])},{default:e(()=>[t(r,{cols:"12"},{default:e(()=>[t(b,{modelValue:s(o).name,"onUpdate:modelValue":l[0]||(l[0]=i=>s(o).name=i),label:a.$t("Name"),"error-messages":s(o).errors.name,outlined:"",dense:""},null,8,["modelValue","label","error-messages"])]),_:1}),t(r,{cols:"12"},{default:e(()=>[t(g,{loading:s(o).processing,type:"submit",block:""},{default:e(()=>[C(k(a.$t("Submit")),1)]),_:1},8,["loading"])]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{D as default};