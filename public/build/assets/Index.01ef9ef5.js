import{u as c}from"./useMailDriverStore.d117c153.js";import a from"./Smtp.698e4ec3.js";import n from"./Basic.066434e7.js";import C from"./Mailgun.35a2afe7.js";import g from"./Ses.618a3449.js";import v from"./SettingsDrawerContent.467232ae.js";import{A as V,c as m,w as r,r as $,o as s,b as i,V as y,d as h,e as l,t,g as D,at as S,bE as b,i as B,k}from"./app.dc2d0110.js";import{V as A}from"./VCol.e64a4a91.js";import{V as M}from"./VContainer.ae849916.js";import"./rules.b4b678c9.js";import"./VForm.25e51c80.js";import"./VSelect.1c594559.js";import"./VCheckboxBtn.8dc877ea.js";import"./VChip.3dfe68ed.js";import"./VRow.12f67658.js";/* empty css              */const P={__name:"Index",props:{mailConfig:{type:Array,required:!0}},setup(f){const u=f,e=c();e.form,e.getMailConfig(u.mailConfig);const p=V(()=>e.form.mail_driver==="mailgun"?C:e.form.mail_driver==="sendmail"?n:e.form.mail_driver==="mail"?n:e.form.mail_driver==="ses"?g:e.form.mail_driver==="smtp"?a:a);function d(){}return(o,w)=>{const _=$("AdminLayout");return s(),m(_,{title:o.$t("Mail Configuration")},{"sub-navbar":r(()=>[i(v)]),default:r(()=>[i(M,null,{default:r(()=>[i(y,{class:"pa-2"},{default:r(()=>[i(h,null,{default:r(()=>[l(t(o.$t("Mail Configuration")),1)]),_:1}),i(D,null,{default:r(()=>[S("p",null,t(o.$t("Below is the form for Configuring Email driver for sending emails from the app. You can also configure third party providers like Sendgrid, SES etc.")),1),(s(),m(b(B(p)),{onOnChangeDriver:d},{default:r(()=>[i(A,{cols:"12"},{default:r(()=>[i(k,{type:"submit"},{default:r(()=>[l(t(o.$t("Save")),1)]),_:1})]),_:1})]),_:1},32))]),_:1})]),_:1})]),_:1})]),_:1},8,["title"])}}};export{P as default};
