import{a as c,c as f,w as l,b as V,o as b,d as e,V as v,i as h,j as g,k as r,m as _,f as $,g as y,u as S}from"./app.c74c21f4.js";import A from"./DrawerContent.965f25c3.js";import{V as i}from"./VCol.fb68aa0d.js";import{V as C}from"./VForm.64f4569b.js";import{V as u}from"./VTextField.2cf6dc35.js";import{V as U}from"./VSwitch.c46a2151.js";import{V as k}from"./VRow.51c37cbe.js";import"./VSelect.5810ae9c.js";import"./VCheckboxBtn.85849725.js";import"./VSelectionControl.e7494f68.js";import"./VLabel.2a4a1171.js";import"./form.655e4f4e.js";import"./VCounter.bd549793.js";/* empty css              */const z={__name:"Create",props:{school:{type:Object,required:!0}},setup(d){const m=d,o=c({name:null,device_id:null,auth_code:null,auth_user:null,is_active:!0}),n=()=>{o.post(route("admin.schools.settings.fingerprint-devices.store",m.school.id),{preserveScroll:!0,onSuccess:t=>S().showNotification(t)})};return(t,s)=>{const p=V("AppLayout");return b(),f(p,{title:t.$t("Add Device"),back:t.route("admin.schools.settings.fingerprint-devices.index",d.school.id)},{"sub-navbar":l(()=>[e(A,{school:d.school},null,8,["school"])]),default:l(()=>[e(k,{justify:"center"},{default:l(()=>[e(i,{cols:"12",md:"6"},{default:l(()=>[e(v,null,{default:l(()=>[e(h,null,{default:l(()=>[e(C,{onSubmit:g(n,["prevent"])},{default:l(()=>[e(i,{cols:"12"},{default:l(()=>[e(u,{modelValue:r(o).name,"onUpdate:modelValue":s[0]||(s[0]=a=>r(o).name=a),label:t.$t("Name"),"error-messages":r(o).errors.name,outlined:""},null,8,["modelValue","label","error-messages"])]),_:1}),e(i,{cols:"12"},{default:l(()=>[e(u,{modelValue:r(o).device_id,"onUpdate:modelValue":s[1]||(s[1]=a=>r(o).device_id=a),label:t.$t("Device ID"),"error-messages":r(o).errors.device_id,outlined:""},null,8,["modelValue","label","error-messages"])]),_:1}),e(i,{cols:"12"},{default:l(()=>[e(u,{modelValue:r(o).auth_code,"onUpdate:modelValue":s[2]||(s[2]=a=>r(o).auth_code=a),label:t.$t("Auth Code"),"error-messages":r(o).errors.auth_code,hint:t.$t("Auth Code provided by the Provider")},null,8,["modelValue","label","error-messages","hint"])]),_:1}),e(i,{cols:"12"},{default:l(()=>[e(u,{modelValue:r(o).auth_user,"onUpdate:modelValue":s[3]||(s[3]=a=>r(o).auth_user=a),label:t.$t("Auth User"),"error-messages":r(o).errors.auth_user,hint:t.$t("Auth User provided by the Provider")},null,8,["modelValue","label","error-messages","hint"])]),_:1}),e(i,{cols:"12"},{default:l(()=>[e(U,{modelValue:r(o).is_active,"onUpdate:modelValue":s[4]||(s[4]=a=>r(o).is_active=a),label:t.$t("Is Active"),"error-messages":r(o).errors.is_active},null,8,["modelValue","label","error-messages"])]),_:1}),e(i,{cols:"12"},{default:l(()=>[e(_,{loading:r(o).processing,color:"primary",type:"submit","prepend-icon":"mdi-content-save"},{default:l(()=>[$(y(t.$t("Save")),1)]),_:1},8,["loading"])]),_:1})]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{z as default};