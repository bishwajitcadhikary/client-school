import{a as g,c as V,w as r,b as c,o as C,d as a,V as _,e as $,f as t,g as n,h,i as d,m as i,j as k,k as o,av as m,u as v}from"./app.c74c21f4.js";import{V as y}from"./VRow.51c37cbe.js";import{V as w}from"./VCol.fb68aa0d.js";import{V as S,a as N}from"./VAlert.e9ebd06b.js";import{V as T}from"./VForm.64f4569b.js";import{V as U}from"./VFileInput.c2114371.js";import{V as B}from"./VTextField.2cf6dc35.js";import{V as F}from"./VTextarea.442fdf9e.js";import{V as L}from"./VContainer.9871394f.js";/* empty css              */import"./form.655e4f4e.js";import"./VCounter.bd549793.js";import"./VLabel.2a4a1171.js";const q=m("br",null,null,-1),A=m("br",null,null,-1),K={__name:"Create",props:{customers:{type:Object,default:null}},setup(j){const l=g({version:null,database:null,change_log:null});function p(){l.post(route("admin.database-upgrades.store"),{onSuccess:e=>{v().showNotification(e)}})}const b=e=>{l.database=e[0]};return(e,u)=>{const f=c("AppLayout");return C(),V(f,{title:e.$t("New Upgrade"),back:e.route("admin.database-upgrades.index")},{default:r(()=>[a(L,null,{default:r(()=>[a(y,{justify:"center"},{default:r(()=>[a(w,{cols:"12",md:"8"},{default:r(()=>[a(_,null,{default:r(()=>[a($,null,{default:r(()=>[t(n(e.$t("New Upgrade")),1)]),_:1}),a(h,null,{default:r(()=>[t(n(e.$t("Create a new database upgrade")),1)]),_:1}),a(d,null,{default:r(()=>[a(S,{color:"error",variant:"outlined",icon:"mdi-alert-circle-outline"},{default:r(()=>[a(N,null,{default:r(()=>[t(n(e.$t("Warning")),1)]),_:1}),t(" "+n(e.$t("Please make sure you have a backup of your database before upgrading. Database upgrade is irreversible."))+" ",1),q,A,a(i,{href:e.route("admin.database-upgrades.download-backup")},{default:r(()=>[t(n(e.$t("Create Backup")),1)]),_:1},8,["href"])]),_:1})]),_:1}),a(d,null,{default:r(()=>[a(T,{onSubmit:k(p,["prevent"])},{default:r(()=>[a(U,{label:e.$t("MySQL File"),rules:[s=>!!s||e.$t("Database is required")],"error-messages":o(l).errors.database,outlined:"",accept:".sql",class:"mb-5","prepend-inner-icon":"mdi-database","prepend-icon":!1,"onUpdate:modelValue":b},null,8,["label","rules","error-messages"]),a(B,{modelValue:o(l).version,"onUpdate:modelValue":u[0]||(u[0]=s=>o(l).version=s),label:e.$t("Version"),rules:[s=>!!s||e.$t("Version is required")],"error-messages":o(l).errors.version,outlined:"",class:"mb-5"},null,8,["modelValue","label","rules","error-messages"]),a(F,{modelValue:o(l).change_log,"onUpdate:modelValue":u[1]||(u[1]=s=>o(l).change_log=s),label:e.$t("Change Log"),rules:[s=>!!s||e.$t("Change Log is required")],"error-messages":o(l).errors.change_log,outlined:"",class:"mb-5"},null,8,["modelValue","label","rules","error-messages"]),a(i,{type:"submit",color:"primary",loading:o(l).processing,disabled:o(l).processing},{default:r(()=>[t(n(e.$t("Upgrade")),1)]),_:1},8,["loading","disabled"])]),_:1},8,["onSubmit"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["title","back"])}}};export{K as default};