import i from"./Table.788a0261.js";import{V as o}from"./VCol.a910cf49.js";import{V as m}from"./VRow.54e80b11.js";import{c as p,w as t,b as _,o as y,d as e,V as u,e as d,f as a,g as r,i as n,k as V,a5 as h}from"./app.4e419244.js";import"./Pagination.dedb92ff.js";import"./DataNotFound.eb5df1c3.js";import"./VTooltip.ef233a6c.js";import"./VTable.03c16a94.js";/* empty css              */const E={__name:"Index",props:{totalEarnings:{type:Number,required:!0},totalOrders:{type:Number,required:!0},totalCustomers:{type:Number,required:!0},orders:{type:Object,default:null}},setup(s){const c=h("currencyFormat");return(l,C)=>{const f=_("AppLayout");return y(),p(f,{title:l.$t("Dashboard")},{default:t(()=>[e(m,{class:"match-height"},{default:t(()=>[e(o,{cols:"12"},{default:t(()=>[e(m,{class:"match-height"},{default:t(()=>[e(o,{cols:"12",sm:"4"},{default:t(()=>[e(u,null,{default:t(()=>[e(d,null,{default:t(()=>[a(r(l.$t("Total Earnings")),1)]),_:1}),e(n,null,{default:t(()=>[a(r(V(c)(s.totalEarnings,l.$page.props.app.currency.code)),1)]),_:1})]),_:1})]),_:1}),e(o,{cols:"12",sm:"4"},{default:t(()=>[e(u,null,{default:t(()=>[e(d,null,{default:t(()=>[a(r(l.$t("Total Orders")),1)]),_:1}),e(n,null,{default:t(()=>[a(r(s.totalOrders),1)]),_:1})]),_:1})]),_:1}),e(o,{cols:"12",sm:"4"},{default:t(()=>[e(u,null,{default:t(()=>[e(d,null,{default:t(()=>[a(r(l.$t("Total Customers")),1)]),_:1}),e(n,null,{default:t(()=>[a(r(s.totalCustomers),1)]),_:1})]),_:1})]),_:1})]),_:1})]),_:1}),e(o,{cols:"12"},{default:t(()=>[e(i,{orders:s.orders},null,8,["orders"])]),_:1})]),_:1})]),_:1},8,["title"])}}};export{E as default};
