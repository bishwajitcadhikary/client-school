import{m as A,f as y,a as $}from"./VCheckboxBtn.8dc877ea.js";import{p as B,bn as I,J as L,bo as N,A as r,S as R,x as U,_ as q,bp as z,v as D,b as t,N as d,bq as J,br as M,bs as j}from"./app.dc2d0110.js";const K=B({name:"VSwitch",inheritAttrs:!1,props:{indeterminate:Boolean,inset:Boolean,flat:Boolean,loading:{type:[Boolean,String],default:!1},...I(),...A()},emits:{"update:indeterminate":e=>!0},setup(e,u){let{attrs:c,slots:a}=u;const n=L(e,"indeterminate"),{loaderClasses:v}=N(e),f=r(()=>typeof e.loading=="string"&&e.loading!==""?e.loading:e.color),m=R(),h=r(()=>e.id||`switch-${m}`);function C(){n.value&&(n.value=!1)}return U(()=>{const[b,g]=q(c),[w,E]=z(e),[V,F]=y(e),s=D();function p(){var l,i;(l=s.value)==null||(i=l.input)==null||i.click()}return t(j,d({class:["v-switch",{"v-switch--inset":e.inset},{"v-switch--indeterminate":n.value},v.value]},b,w,{id:h.value}),{...a,default:l=>{let{id:i,isDisabled:_,isReadonly:k,isValid:S}=l;return t($,d({ref:s},V,{id:i.value,type:"checkbox","onUpdate:modelValue":C,"aria-checked":n.value?"mixed":void 0,disabled:_.value,readonly:k.value},g),{...a,default:()=>t("div",{class:"v-switch__track",onClick:p},null),input:P=>{let{textColorClasses:x}=P;return t("div",{class:["v-switch__thumb",x.value]},[e.loading&&t(J,{name:"v-switch",active:!0,color:S.value===!1?void 0:f.value},{default:o=>a.loader?a.loader(o):t(M,{active:o.isActive,color:o.color,indeterminate:!0,size:"16",width:"2"},null)})])}})}})}),{}}});export{K as V};
