import{a as u,c as d,w as e,b as p,o as f,d as t,V,i as _,j as c,l as b,k as r,n as g,f as C,g as k}from"./app.d12111a2.js";import w from"./SettingsDrawerContent.270bc2bd.js";import{V as y}from"./VRow.a42250e5.js";import{V as s}from"./VCol.4fb9d811.js";import{V as S}from"./VForm.bbb8df20.js";import{V as $}from"./VContainer.6eda6352.js";import"./VSelect.7ed835a6.js";import"./VCheckboxBtn.522e9dc8.js";import"./VSelectionControl.2cf78e55.js";import"./VChip.63a6f5b3.js";/* empty css              */const M={__name:"Create",setup(v){const o=u({name:null});function n(){o.post(route("admin.settings.roles.store"))}return(a,l)=>{const m=p("AppLayout");return f(),d(m,{title:a.$t("Create Role"),back:a.route("admin.settings.roles.index")},{"sub-navbar":e(()=>[t(w)]),default:e(()=>[t($,null,{default:e(()=>[t(y,null,{default:e(()=>[t(s,{cols:"12",sm:"6"},{default:e(()=>[t(V,null,{default:e(()=>[t(_,null,{default:e(()=>[t(S,{onSubmit:c(n,["prevent"])},{default:e(()=>[t(s,{cols:"12"},{default:e(()=>[t(b,{modelValue:r(o).name,"onUpdate:modelValue":l[0]||(l[0]=i=>r(o).name=i),label:a.$t("Name"),"error-messages":r(o).errors.name,outlined:"",dense:""},null,8,["modelValue","label","error-messages"])]),_:1}),t(s,{cols:"12"},{default:e(()=>[t(g,{loading:r(o).processing,type:"submit",block:""},{default:e(()=>[C(k(a.$t("Submit")),1)]),_:1},8,["loading"])]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{M as default};