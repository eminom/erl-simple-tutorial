
%%  -*-
{application, tcpecho,
  [{description, "TCP echo hello world"},
   {vsn, "0.1.0"},
   {modules, [tcpecho_svr, tcpecho_app, tcpecho_sup]},
   {registered, [tcpecho_sup, tcpecho_svr]},
   {applications, [kernel, stdlib]},
   {mod, {tcpecho_app, []}}
]}.
