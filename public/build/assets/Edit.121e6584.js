import{a as f,c as V,w as e,b as c,o as _,d as t,V as b,i as g,j as k,k as r,m as C,n as y,f as m,g as v}from"./app.88dbe7b3.js";import w from"./SettingsDrawerContent.7240e36e.js";import{V as S}from"./VRow.f135c61b.js";import{V as s}from"./VCol.2c4b1735.js";import{V as $}from"./VForm.a530d3c0.js";import{V as x}from"./VTextField.b60301ed.js";import{V as B}from"./VContainer.184131ca.js";import"./VSelect.56edbde5.js";import"./VCheckboxBtn.992999b2.js";import"./VSelectionControl.3a4c124d.js";import"./VLabel.3c5713ec.js";import"./form.4587b2ea.js";import"./VCounter.473ffdf9.js";/* empty css              */const U={__name:"Edit",props:{role:{type:Object,required:!0}},setup(i){const l=i,o=f({name:l.role.name});function u(){o.put(route("admin.settings.roles.update",{role:l.role.id}))}return(a,n)=>{const d=c("AppLayout");return _(),V(d,{title:a.$t("Edit Role"),back:a.route("admin.settings.roles.index")},{"sub-navbar":e(()=>[t(w)]),default:e(()=>[t(B,null,{default:e(()=>[t(S,null,{default:e(()=>[t(s,{cols:"12",sm:"6"},{default:e(()=>[t(b,null,{default:e(()=>[t(g,null,{default:e(()=>[t($,{onSubmit:k(u,["prevent"])},{default:e(()=>[t(s,{cols:"12"},{default:e(()=>[t(x,{modelValue:r(o).name,"onUpdate:modelValue":n[0]||(n[0]=p=>r(o).name=p),label:a.$t("Name"),"error-messages":r(o).errors.name,outlined:"",dense:""},null,8,["modelValue","label","error-messages"])]),_:1}),t(s,{cols:"12"},{default:e(()=>[t(C,{loading:r(o).processing,type:"submit",block:""},{default:e(()=>[t(y,null,{default:e(()=>[m("mdi-content-save")]),_:1}),m(" "+v(a.$t("Submit")),1)]),_:1},8,["loading"])]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{U as default};