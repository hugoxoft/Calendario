<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="calendario.aspx.vb" Inherits="proyectos_varios.calendario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calendario</title>

    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.0.3/index.global.min.js" ></script>

    <style>
        body {
            margin: 40px 10px;
            padding: 0;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }

        #calendar {
            max-width: 1100px;
            margin: 0 auto;
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var date = new Date();
            var d = date.getDate(),
                m = date.getMonth(),
                y = date.getFullYear();

            var Calendar = FullCalendar.Calendar;
            var calendarEl = document.getElementById("calendar");

            //Se puede manejar una selección de días aleatorios al llenar el arreglo
            var fillcalendar = [];
            for (let i = 1; i < 6; i++) {
                fillcalendar.push({
                    title: "Reunión " + i,
                    start: new Date(y, m, i),
                    backgroundColor: "#FEC868",
                    borderColor: "#FEC868",
                    allDay: true
                });
            }

            var calendar = new Calendar(calendarEl, {
                headerToolbar: {
                    left: "prev,next today",
                    center: "title",
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                themeSystem: "bootstrap",
                events: fillcalendar,

                //De esta forma quedan la selección de los días fijos
                //events:
                //[
                //    { title: 'Evento 1', start: '2023-01-01' },
                //    { title: 'Reunión', start: '2023-02-13T07:00:00'},
                //    { title: 'Click ´para Google', url: 'http://google.com/', start: '2023-02-28'}
                //]

                editable: true, // false = bloquea poder mover la selección de los días
                droppable: true, 
                drop: function (info) {
                    if (checkbox.checked) {
                        info.draggedEl.parentNode.removeChild(info.draggedEl);
                    }
                }
            });
            calendar.render();
        });
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id='calendar-container'>
                <div id='calendar'></div>
            </div>
        </div>
    </form>
</body>
</html>
