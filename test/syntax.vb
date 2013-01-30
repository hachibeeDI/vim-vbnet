NameSpace Hoge
    Public Class HogeFoooo
        Inherits BaseModel

        Private Property hoge As Hoge

        Public Sub New(Byref ref as Dep, ByVal var as Val)
        End Sub

        ''' <summary> </summary>
        Public Overridable Function YaiYai() As IEnumerable(Of Models.Boo)
            Dim var As New List(Of Integer) From {1, 2, 3, 4}
            var.Foreach(sub(i) print(i))
            var.Select(Function(i)
                           return If(i Mod 3 = 0, "Foo", "コポォ")
                       End Function)
            Return _
                Executor.ExecuteReader(MyBase.getConnection,
                    "mogamogamoga",
                    ) _
                    .Select(
                        Function(row) New With
                                         {
                                             .id = row.getValue_Type(Of Integer)("cs"),
                                             .idea = row.getValue_Type(Of String)("haskell"),
                                             .ikea = row.getValue_Type(Of DateTime)("python")
                                         }
                    ).ToList()
        End Function
    End Class
End NameSpace
