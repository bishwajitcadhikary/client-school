import{c as f,w as i,j as n,o as p,d as l,k as r,bw as V}from"./app.c74c21f4.js";import{r as _}from"./rules.aed30137.js";import{u as b}from"./useMailDriverStore.51abdfcb.js";import{V as c}from"./VForm.64f4569b.js";import{V as t}from"./VCol.fb68aa0d.js";import{V as v}from"./VSelect.5810ae9c.js";import{V as s}from"./VTextField.2cf6dc35.js";import{V as S}from"./VRow.51c37cbe.js";import"./form.655e4f4e.js";/* empty css              */import"./VCheckboxBtn.85849725.js";import"./VSelectionControl.e7494f68.js";import"./VLabel.2a4a1171.js";import"./VCounter.bd549793.js";const R={__name:"Basic",setup(w){const e=b();function u(){e.form.put(route("admin.settings.mail.update"),{onSuccess:o=>{console.log(o)}})}function d(o){e.form.mail_driver=o}return(o,m)=>(p(),f(c,{onSubmit:n(u,["prevent"])},{default:i(()=>[l(S,null,{default:i(()=>[l(t,{cols:"12",sm:"6"},{default:i(()=>[l(v,{modelValue:r(e).form.mail_driver,"onUpdate:modelValue":[m[0]||(m[0]=a=>r(e).form.mail_driver=a),d],label:o.$t("Mail Driver"),items:r(e).mail_drivers,rules:[r(_).required]},null,8,["modelValue","label","items","rules"])]),_:1}),l(t,{cols:"12",sm:"6"},{default:i(()=>[l(s,{modelValue:r(e).form.basic.mail_from_address,"onUpdate:modelValue":m[1]||(m[1]=a=>r(e).form.basic.mail_from_address=a),label:o.$t("Mail From Address"),type:"email"},null,8,["modelValue","label"])]),_:1}),l(t,{cols:"12",sm:"6"},{default:i(()=>[l(s,{modelValue:r(e).form.basic.mail_from_name,"onUpdate:modelValue":m[2]||(m[2]=a=>r(e).form.basic.mail_from_name=a),label:o.$t("Mail From Name")},null,8,["modelValue","label"])]),_:1})]),_:1}),V(o.$slots,"default")]),_:3},8,["onSubmit"]))}};export{R as default};
