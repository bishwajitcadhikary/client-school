import{c as f,w as t,j as V,o as b,d as m,k as e,bv as _}from"./app.024f86d4.js";import{r as M}from"./rules.bd1e245b.js";import{u as v}from"./useMailDriverStore.08d0f0d8.js";import{V as U}from"./VForm.2f49ab8c.js";import{V as s}from"./VCol.19781618.js";import{V as d}from"./VSelect.2b406d4f.js";import{V as i}from"./VTextField.4f31bb4a.js";import{V as $}from"./VRow.a17a7fb6.js";import"./form.51b8e79f.js";/* empty css              */import"./VCheckboxBtn.26820d3d.js";import"./VSelectionControl.e3763b2e.js";import"./VCounter.2419f175.js";const E={__name:"Smtp",emits:["on-change-driver","loading"],setup(S,{emit:u}){const l=v();function n(){l.form.put(route("admin.settings.mail.update"),{onSuccess:r=>{console.log(r)}})}function p(r){l.form.mail_driver=r,u("on-change-driver",r)}return(r,o)=>(b(),f(U,{onSubmit:V(n,["prevent"])},{default:t(()=>[m($,null,{default:t(()=>[m(s,{cols:"12",sm:"6"},{default:t(()=>[m(d,{modelValue:e(l).form.mail_driver,"onUpdate:modelValue":[o[0]||(o[0]=a=>e(l).form.mail_driver=a),p],label:r.$t("Mail Driver"),items:e(l).mail_drivers,rules:[e(M).required]},null,8,["modelValue","label","items","rules"])]),_:1}),m(s,{cols:"12",sm:"6"},{default:t(()=>[m(i,{modelValue:e(l).form.smtp.mail_host,"onUpdate:modelValue":o[1]||(o[1]=a=>e(l).form.smtp.mail_host=a),label:r.$t("Mail Host")},null,8,["modelValue","label"])]),_:1}),m(s,{cols:"12",sm:"6"},{default:t(()=>[m(i,{modelValue:e(l).form.smtp.mail_username,"onUpdate:modelValue":o[2]||(o[2]=a=>e(l).form.smtp.mail_username=a),modelModifiers:{trim:!0},label:r.$t("Mail Username")},null,8,["modelValue","label"])]),_:1}),m(s,{cols:"12",sm:"6"},{default:t(()=>[m(i,{modelValue:e(l).form.smtp.mail_password,"onUpdate:modelValue":o[3]||(o[3]=a=>e(l).form.smtp.mail_password=a),modelModifiers:{trim:!0},label:r.$t("Mail Password")},null,8,["modelValue","label"])]),_:1}),m(s,{cols:"12",sm:"6"},{default:t(()=>[m(i,{modelValue:e(l).form.smtp.mail_port,"onUpdate:modelValue":o[4]||(o[4]=a=>e(l).form.smtp.mail_port=a),label:r.$t("Mail Port")},null,8,["modelValue","label"])]),_:1}),m(s,{cols:"12",sm:"6"},{default:t(()=>[m(d,{modelValue:e(l).form.smtp.mail_encryption,"onUpdate:modelValue":o[5]||(o[5]=a=>e(l).form.smtp.mail_encryption=a),label:r.$t("Mail Encryption"),items:e(l).mail_encryption},null,8,["modelValue","label","items"])]),_:1}),m(s,{cols:"12",sm:"6"},{default:t(()=>[m(i,{modelValue:e(l).form.smtp.mail_from_address,"onUpdate:modelValue":o[6]||(o[6]=a=>e(l).form.smtp.mail_from_address=a),label:r.$t("Mail From Address"),type:"email"},null,8,["modelValue","label"])]),_:1}),m(s,{cols:"12",sm:"6"},{default:t(()=>[m(i,{modelValue:e(l).form.smtp.mail_from_name,"onUpdate:modelValue":o[7]||(o[7]=a=>e(l).form.smtp.mail_from_name=a),label:r.$t("Mail From Name")},null,8,["modelValue","label"])]),_:1})]),_:1}),_(r.$slots,"default")]),_:3},8,["onSubmit"]))}};export{E as default};
