import{c as f,w as i,j as n,o as p,d as l,k as r,bz as V}from"./app.ff209ba5.js";import{r as _}from"./rules.06076658.js";import{u as b}from"./useMailDriverStore.b7275ea9.js";import{V as c}from"./VForm.75801f54.js";import{V as t}from"./VCol.196fcba1.js";import{V as v}from"./VSelect.c3f11ce8.js";import{V as s}from"./VTextField.7da22a41.js";import{V as S}from"./VRow.1d74aad8.js";import"./form.96b9598d.js";/* empty css              */import"./VCheckboxBtn.510f2727.js";import"./VSelectionControl.67abed86.js";import"./VCounter.feafebbb.js";const z={__name:"Basic",setup(F){const e=b();function u(){e.form.put(route("admin.settings.mail.update"),{onSuccess:o=>{console.log(o)}})}function d(o){e.form.mail_driver=o}return(o,m)=>(p(),f(c,{onSubmit:n(u,["prevent"])},{default:i(()=>[l(S,null,{default:i(()=>[l(t,{cols:"12",sm:"6"},{default:i(()=>[l(v,{modelValue:r(e).form.mail_driver,"onUpdate:modelValue":[m[0]||(m[0]=a=>r(e).form.mail_driver=a),d],label:o.$t("Mail Driver"),items:r(e).mail_drivers,rules:[r(_).required]},null,8,["modelValue","label","items","rules"])]),_:1}),l(t,{cols:"12",sm:"6"},{default:i(()=>[l(s,{modelValue:r(e).form.basic.mail_from_address,"onUpdate:modelValue":m[1]||(m[1]=a=>r(e).form.basic.mail_from_address=a),label:o.$t("Mail From Address"),type:"email"},null,8,["modelValue","label"])]),_:1}),l(t,{cols:"12",sm:"6"},{default:i(()=>[l(s,{modelValue:r(e).form.basic.mail_from_name,"onUpdate:modelValue":m[2]||(m[2]=a=>r(e).form.basic.mail_from_name=a),label:o.$t("Mail From Name")},null,8,["modelValue","label"])]),_:1})]),_:1}),V(o.$slots,"default")]),_:3},8,["onSubmit"]))}};export{z as default};