import{h as $,i as K,j as W,I as k,m as q,k as G,l as O,n as U,p as H,q as J,s as X,v as Q,x as Y,y as Z,z as ee,A as ae,B,C as te,D as m,E as _,G as x,H as ne,a as l,J as V,K as h,L as C,M as R,o as ie,d as le,w as I,V as w,g as se,N as re}from"./app.dfca5287.js";import{V as ue}from"./VRow.d39a107d.js";import{V as oe}from"./VCol.4592c862.js";function ve(){const e=$([]);K(()=>e.value=[]);function f(s,y){e.value[y]=s}return{refs:e,updateRef:f}}const de=W({name:"VPagination",props:{activeColor:String,start:{type:[Number,String],default:1},modelValue:{type:Number,default:e=>e.start},disabled:Boolean,length:{type:[Number,String],default:1,validator:e=>e%1===0},totalVisible:[Number,String],firstIcon:{type:k,default:"$first"},prevIcon:{type:k,default:"$prev"},nextIcon:{type:k,default:"$next"},lastIcon:{type:k,default:"$last"},ariaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.root"},pageAriaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.page"},currentPageAriaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.currentPage"},firstAriaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.first"},previousAriaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.previous"},nextAriaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.next"},lastAriaLabel:{type:String,default:"$vuetify.pagination.ariaLabel.last"},ellipsis:{type:String,default:"..."},showFirstLastPage:Boolean,...q(),...G(),...O(),...U(),...H(),...J({tag:"nav"}),...X(),...Q({variant:"text"})},emits:{"update:modelValue":e=>!0,first:e=>!0,prev:e=>!0,next:e=>!0,last:e=>!0},setup(e,f){let{slots:s,emit:y}=f;const t=Y(e,"modelValue"),{t:r,n:p}=Z(),{isRtl:P}=ee(),{themeClasses:N}=ae(e),S=$(-1);B(void 0,{scoped:!0});const{resizeRef:D}=te(a=>{if(!a.length)return;const{target:n,contentRect:i}=a[0],v=n.querySelector(".v-pagination__list > *");if(!v)return;const d=i.width,b=v.offsetWidth+parseFloat(getComputedStyle(v).marginRight)*2,j=e.showFirstLastPage?5:3;S.value=Math.max(0,Math.floor(+((d-b*j)/b).toFixed(2)))}),u=m(()=>parseInt(e.length,10)),o=m(()=>parseInt(e.start,10)),c=m(()=>e.totalVisible?parseInt(e.totalVisible,10):S.value>=0?S.value:u.value),F=m(()=>{if(u.value<=0||isNaN(u.value)||u.value>Number.MAX_SAFE_INTEGER)return[];if(c.value<=1)return[t.value];if(u.value<=c.value)return _(u.value,o.value);const a=c.value%2===0,n=a?c.value/2:Math.floor(c.value/2),i=a?n:n+1,v=u.value-n;if(i-t.value>=0)return[..._(Math.max(1,c.value-1),o.value),e.ellipsis,u.value];if(t.value-v>=(a?1:0)){const d=c.value-1,b=u.value-d+o.value;return[o.value,e.ellipsis,..._(d,b)]}else{const d=Math.max(1,c.value-3),b=d===1?t.value:t.value-Math.ceil(d/2)+o.value;return[o.value,e.ellipsis,..._(d,b),e.ellipsis,u.value]}});function L(a,n,i){a.preventDefault(),t.value=n,i&&y(i,n)}const{refs:M,updateRef:z}=ve();B({VPaginationBtn:{color:x(e,"color"),border:x(e,"border"),density:x(e,"density"),size:x(e,"size"),variant:x(e,"variant")}});const E=m(()=>F.value.map((a,n)=>{const i=v=>z(v,n);if(typeof a=="string")return{isActive:!1,key:`ellipsis-${n}`,page:a,props:{ref:i,ellipsis:!0,icon:!0,disabled:!0}};{const v=a===t.value;return{isActive:v,key:a,page:p(a),props:{ref:i,ellipsis:!1,icon:!0,disabled:!!e.disabled||e.length<2,elevation:e.elevation,rounded:e.rounded,color:v?e.activeColor:e.color,ariaCurrent:v,ariaLabel:r(v?e.currentPageAriaLabel:e.pageAriaLabel,n+1),onClick:d=>L(d,a)}}}})),g=m(()=>{const a=!!e.disabled||t.value<=o.value,n=!!e.disabled||t.value>=o.value+u.value-1;return{first:e.showFirstLastPage?{icon:P.value?e.lastIcon:e.firstIcon,onClick:i=>L(i,o.value,"first"),disabled:a,ariaLabel:r(e.firstAriaLabel),ariaDisabled:a}:void 0,prev:{icon:P.value?e.nextIcon:e.prevIcon,onClick:i=>L(i,t.value-1,"prev"),disabled:a,ariaLabel:r(e.previousAriaLabel),ariaDisabled:a},next:{icon:P.value?e.prevIcon:e.nextIcon,onClick:i=>L(i,t.value+1,"next"),disabled:n,ariaLabel:r(e.nextAriaLabel),ariaDisabled:n},last:e.showFirstLastPage?{icon:P.value?e.firstIcon:e.lastIcon,onClick:i=>L(i,o.value+u.value-1,"last"),disabled:n,ariaLabel:r(e.lastAriaLabel),ariaDisabled:n}:void 0}});function A(){var a;const n=t.value-o.value;(a=M.value[n])==null||a.$el.focus()}function T(a){a.key===C.left&&!e.disabled&&t.value>e.start?(t.value=t.value-1,R(A)):a.key===C.right&&!e.disabled&&t.value<o.value+u.value-1&&(t.value=t.value+1,R(A))}return ne(()=>l(e.tag,{ref:D,class:["v-pagination",N.value],role:"navigation","aria-label":r(e.ariaLabel),onKeydown:T,"data-test":"v-pagination-root"},{default:()=>[l("ul",{class:"v-pagination__list"},[e.showFirstLastPage&&l("li",{key:"first",class:"v-pagination__first","data-test":"v-pagination-first"},[s.first?s.first(g.value.first):l(V,h({_as:"VPaginationBtn"},g.value.first),null)]),l("li",{key:"prev",class:"v-pagination__prev","data-test":"v-pagination-prev"},[s.prev?s.prev(g.value.prev):l(V,h({_as:"VPaginationBtn"},g.value.prev),null)]),E.value.map((a,n)=>l("li",{key:a.key,class:["v-pagination__item",{"v-pagination__item--is-active":a.isActive}],"data-test":"v-pagination-item"},[s.item?s.item(a):l(V,h({_as:"VPaginationBtn"},a.props),{default:()=>[a.page]})])),l("li",{key:"next",class:"v-pagination__next","data-test":"v-pagination-next"},[s.next?s.next(g.value.next):l(V,h({_as:"VPaginationBtn"},g.value.next),null)]),e.showFirstLastPage&&l("li",{key:"last",class:"v-pagination__last","data-test":"v-pagination-last"},[s.last?s.last(g.value.last):l(V,h({_as:"VPaginationBtn"},g.value.last),null)])])]})),{}}}),ce={key:0,class:"text-center"},me={__name:"Pagination",props:{pagination:{type:Object,default:null}},setup(e){const f=e,s=$(f.pagination.current_page);function y(t){re.Inertia.get(f.pagination.path,{page:t},{preserveScroll:!0,preserveState:!0})}return(t,r)=>e.pagination.last_page>1?(ie(),le("div",ce,[l(w,null,{default:I(()=>[l(ue,{justify:"center"},{default:I(()=>[l(oe,{cols:"8"},{default:I(()=>[l(w,{class:"max-width"},{default:I(()=>[l(de,{modelValue:s.value,"onUpdate:modelValue":[r[0]||(r[0]=p=>s.value=p),y],class:"my-4",length:e.pagination.last_page,onPrev:r[1]||(r[1]=p=>t.$inertia.visit(e.pagination.prev_page_url)),onNext:r[2]||(r[2]=p=>t.$inertia.visit(e.pagination.next_page_url))},null,8,["modelValue","length"])]),_:1})]),_:1})]),_:1})]),_:1})])):se("",!0)}};export{me as _};