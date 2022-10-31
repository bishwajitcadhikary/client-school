import{s as J,b8 as L,b9 as Q,ba as W,K as X,B as V,r as d,bb as Y,aI as v,bc as Z,y as ee,a1 as te,bd as ae,be as ne,d as a,bf as le,O as k,M as I,a2 as _,a3 as oe,bg as re,bh as ie,bi as ue,z as se,ap as N,bj as ce,ar as de,aK as fe}from"./app.d8f6f310.js";const xe=J({name:"VTextarea",directives:{Intersect:L},inheritAttrs:!1,props:{autoGrow:Boolean,autofocus:Boolean,counter:[Boolean,Number,String],counterValue:Function,hint:String,persistentHint:Boolean,prefix:String,placeholder:String,persistentPlaceholder:Boolean,persistentCounter:Boolean,noResize:Boolean,rows:{type:[Number,String],default:5,validator:e=>!isNaN(parseFloat(e))},maxRows:{type:[Number,String],validator:e=>!isNaN(parseFloat(e))},suffix:String,...Q(),...W()},emits:{"click:control":e=>!0,"update:modelValue":e=>!0},setup(e,p){let{attrs:b,emit:z,slots:i}=p;const n=X(e,"modelValue"),$=V(()=>typeof e.counterValue=="function"?e.counterValue(n.value):(n.value||"").toString().length),T=V(()=>{if(b.maxlength)return b.maxlength;if(!(!e.counter||typeof e.counter!="number"&&typeof e.counter!="string"))return e.counter});function A(t,l){var o,r;!e.autofocus||!t||(o=l[0].target)==null||(r=o.focus)==null||r.call(o)}const P=d(),x=d(),u=d(!1),R=d(""),m=d(),S=V(()=>u.value||e.persistentPlaceholder),D=V(()=>e.messages.length?e.messages:S.value||e.persistentHint?e.hint:"");function y(){if(m.value!==document.activeElement){var t;(t=m.value)==null||t.focus()}u.value||(u.value=!0)}function G(t){y(),z("click:control",t)}function M(t){t.stopPropagation(),y(),N(()=>{n.value="",ce(e["onClick:clear"],t)})}function U(t){n.value=t.target.value}const s=d();function c(){!e.autoGrow||N(()=>{if(!s.value||!x.value)return;const t=getComputedStyle(s.value),l=getComputedStyle(x.value.$el),o=parseFloat(t.getPropertyValue("--v-field-padding-top"))+parseFloat(t.getPropertyValue("--v-input-padding-top"))+parseFloat(t.getPropertyValue("--v-field-padding-bottom")),r=s.value.scrollHeight,C=parseFloat(t.lineHeight),w=Math.max(parseFloat(e.rows)*C+o,parseFloat(l.getPropertyValue("--v-input-control-height"))),F=parseFloat(e.maxRows)*C+o||1/0;R.value=de(fe(r!=null?r:0,w,F))})}Y(c),v(n,c),v(()=>e.rows,c),v(()=>e.maxRows,c),v(()=>e.density,c);let g;return v(s,t=>{if(t)g=new ResizeObserver(c),g.observe(s.value);else{var l;(l=g)==null||l.disconnect()}}),Z(()=>{var t;(t=g)==null||t.disconnect()}),ee(()=>{const t=!!(i.counter||e.counter||e.counterValue),l=!!(t||i.details),[o,r]=te(b),[{modelValue:C,...w}]=ae(e),[F]=ne(e);return a(ue,k({ref:P,modelValue:n.value,"onUpdate:modelValue":f=>n.value=f,class:["v-textarea v-text-field",{"v-textarea--prefixed":e.prefix,"v-textarea--suffixed":e.suffix,"v-text-field--prefixed":e.prefix,"v-text-field--suffixed":e.suffix,"v-textarea--auto-grow":e.autoGrow,"v-textarea--no-resize":e.noResize||e.autoGrow,"v-text-field--flush-details":["plain","underlined"].includes(e.variant)}],"onClick:prepend":e["onClick:prepend"],"onClick:append":e["onClick:append"]},o,w,{messages:D.value}),{...i,default:f=>{let{isDisabled:h,isDirty:B,isReadonly:E,isValid:K}=f;return a(le,k({ref:x,style:{"--v-textarea-control-height":R.value},"onClick:control":G,"onClick:clear":M,"onClick:prependInner":e["onClick:prependInner"],"onClick:appendInner":e["onClick:appendInner"],role:"textbox"},F,{active:S.value||B.value,dirty:B.value||e.dirty,focused:u.value,error:K.value===!1}),{...i,default:O=>{let{props:{class:H,...j}}=O;return a(I,null,[e.prefix&&a("span",{class:"v-text-field__prefix"},[e.prefix]),_(a("textarea",k({ref:m,class:H,value:n.value,onInput:U,autofocus:e.autofocus,readonly:E.value,disabled:h.value,placeholder:e.placeholder,rows:e.rows,name:e.name,onFocus:y,onBlur:()=>u.value=!1},j,r),null),[[oe("intersect"),{handler:A},null,{once:!0}]]),e.autoGrow&&_(a("textarea",{class:[H,"v-textarea__sizer"],"onUpdate:modelValue":q=>n.value=q,ref:s,readonly:!0,"aria-hidden":"true"},null),[[re,n.value]]),e.suffix&&a("span",{class:"v-text-field__suffix"},[e.suffix])])}})},details:l?f=>{var h;return a(I,null,[(h=i.details)==null?void 0:h.call(i,f),t&&a(I,null,[a("span",null,null),a(ie,{active:e.persistentCounter||u.value,value:$.value,max:T.value},i.counter)])])}:void 0})}),se({},P,x,m)}});export{xe as V};