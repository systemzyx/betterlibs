local a = {windowCount = 0, flags = {}}
local b = {}
setmetatable(
    b,
    {__index = function(c, d)
            return game:GetService(d)
        end, __newindex = function(e, f)
            e[f] = nil
            return
        end}
)
local g
local h = b.Players.LocalPlayer:GetMouse()
local userInputService = game:GetService("UserInputService")

function Drag(i, j)
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        i.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    j.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = i.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    j.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    userInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

function ClickEffect(r)
    spawn(
        function()
            if r.ClipsDescendants ~= true then
                r.ClipsDescendants = true
            end
            local s = Instance.new("ImageLabel")
            s.Name = "Ripple"
            s.Parent = r
            s.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            s.BackgroundTransparency = 1.000
            s.ZIndex = 8
            s.Image = "rbxassetid://2708891598"
            s.ImageTransparency = 0.800
            s.ScaleType = Enum.ScaleType.Fit
            s.ImageColor3 = Color3.fromRGB(131, 132, 255)
            s.Position =
                UDim2.new(
                (h.X - s.AbsolutePosition.X) / r.AbsoluteSize.X,
                0,
                (h.Y - s.AbsolutePosition.Y) / r.AbsoluteSize.Y,
                0
            )
            b.TweenService:Create(
                s,
                TweenInfo.new(1),
                {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)}
            ):Play()
            wait(0.25)
            b.TweenService:Create(s, TweenInfo.new(.5), {ImageTransparency = 1}):Play()
            repeat
                wait()
            until s.ImageTransparency == 1
            s:Destroy()
        end
    )
end

local t = Instance.new("ScreenGui")
t.Name = b.HttpService:GenerateGUID()
t.Parent = b.RunService:IsStudio() and b.Players.LocalPlayer:WaitForChild("PlayerGui") or b.CoreGui
b.UserInputService.InputBegan:Connect(
    function(u, v)
        if u.KeyCode == Enum.KeyCode.LeftShift and not v then
            t.Enabled = not t.Enabled
        end
    end
)

function a:Window(w)
    local x = false
    a.windowCount = a.windowCount + 1
    local y = Instance.new("Frame")
    local z = Instance.new("Frame")
    local A = Instance.new("UIGradient")
    local B = Instance.new("TextLabel")
    local C = Instance.new("TextButton")
    local D = Instance.new("ImageLabel")
    local E = Instance.new("Frame")
    local F = Instance.new("UIListLayout")
    local G = Instance.new("Frame")
    y.Name = "Top"
    y.Parent = t
    y.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
    y.BorderSizePixel = 0
    y.Position = UDim2.new(0, 25, 0, -30 + 36 * a.windowCount + 6 * a.windowCount)
    y.Size = UDim2.new(0, 212, 0, 36)
    Drag(y, y)
    z.Name = "WindowLine"
    z.Parent = y
    z.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    z.BorderSizePixel = 0
    z.Position = UDim2.new(0, 0, 0, 34)
    z.Size = UDim2.new(0, 212, 0, 2)
 local rs = game:GetService("RunService")
local t = 0
rs.RenderStepped:Connect(function(dt)
    t += dt * 0.3 -- slower transition (reduce this value more to slow it further)
    local function hsv(i) return Color3.fromHSV((t + i) % 1, 1, 1) end
    A.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, hsv(0)),
        ColorSequenceKeypoint.new(1, hsv(0.2))
    }
end)
    A.Name = "WindowLineGradient"
    A.Parent = z
    B.Name = "Header"
    B.Parent = y
    B.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    B.BackgroundTransparency = 1.000
    B.BorderSizePixel = 0
    B.Size = UDim2.new(0, 54, 0, 34)
    B.Font = Enum.Font.GothamSemibold
    B.Text = "   " .. tostring(w) or ""
    B.TextColor3 = Color3.fromRGB(255, 255, 255)
    B.TextSize = 14.000
    B.TextXAlignment = Enum.TextXAlignment.Left

    C.Name = "WindowToggle"
    C.Parent = y
    C.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    C.BackgroundTransparency = 1.000
    C.BorderSizePixel = 0
    C.Position = UDim2.new(0.835270762, 0, 0, 0)
    C.Size = UDim2.new(0, 34, 0, 34)
    C.Font = Enum.Font.SourceSans
    C.Text = ""
    C.TextColor3 = Color3.fromRGB(0, 0, 0)
    C.TextSize = 14.000
    D.Name = "WindowToggleImg"
    D.Parent = C
    D.AnchorPoint = Vector2.new(0.5, 0.5)
    D.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    D.BackgroundTransparency = 1.000
    D.BorderSizePixel = 0
    D.Position = UDim2.new(0.5, 0, 0.5, 0)
    D.Size = UDim2.new(0, 18, 0, 18)
    D.Image = "rbxassetid://3926305904"
    D.ImageRectOffset = Vector2.new(524, 764)
    D.ImageRectSize = Vector2.new(36, 36)
    D.Rotation = 180
    E.Name = "Bottom"
    E.Parent = y
    E.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    E.BorderSizePixel = 0
    E.ClipsDescendants = true
    E.Position = UDim2.new(0, 0, 1, 0)
    E.Size = UDim2.new(0, 212, 0, 0)
    F.Name = "BottomLayout"
    F.Parent = E
    F.HorizontalAlignment = Enum.HorizontalAlignment.Center
    F.SortOrder = Enum.SortOrder.LayoutOrder
    F.Padding = UDim.new(0, 4)
    G.Name = "PaddingThing"
    G.Parent = E
    G.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    G.BorderSizePixel = 0
    G.Position = UDim2.new(0.263033181, 0, 0, 0)
    G.Size = UDim2.new(0, 100, 0, 0)
    local H = false
    local function I()
        if H then
            return
        end
        x = not x
        local H = true
        b.TweenService:Create(
            E,
            TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 212, 0, x and F.AbsoluteContentSize.Y + 4 or 0)}
        ):Play()
        b.TweenService:Create(
            D,
            TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Rotation = x and 0 or 180}
        ):Play()
        wait(.25)
        H = false
    end
    local function J()
        if H or not x then
            return
        end
        E.Size.Y.Offset = F.AbsoluteContentSize.Y + 4
    end
    F:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(J)
    C.MouseButton1Click:Connect(I)
    local K = {}
    function K:Label(L)
        local M = Instance.new("TextButton")
        M.Name = "Label"
        M.Parent = E
        M.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        M.BorderSizePixel = 0
        M.Position = UDim2.new(0.0212264154, 0, 0.71676302, 0)
        M.Size = UDim2.new(0, 203, 0, 26)
        M.AutoButtonColor = false
        M.Font = Enum.Font.GothamSemibold
        M.Text = tostring(L) or ""
        M.TextColor3 = Color3.fromRGB(255, 255, 255)
        M.TextSize = 14.000
        return M
    end
    function K:Button(L, N)
        local O = Instance.new("Frame")
        local P = Instance.new("TextButton")
        local N = N or function()
            end
        O.Name = "ButtonObj"
        O.Parent = E
        O.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        O.BorderSizePixel = 0
        O.Position = UDim2.new(0, 0, 0.0172413792, 0)
        O.Size = UDim2.new(0, 203, 0, 36)
        P.Name = "Button"
        P.Parent = O
        P.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        P.BackgroundTransparency = 1.000
        P.BorderSizePixel = 0
        P.Size = UDim2.new(0, 203, 0, 36)
        P.Font = Enum.Font.Gotham
        P.Text = "  " .. tostring(L) or ""
        P.TextColor3 = Color3.fromRGB(255, 255, 255)
        P.TextSize = 14.000
        P.TextXAlignment = Enum.TextXAlignment.Left
        P.MouseEnter:Connect(
            function()
                b.TweenService:Create(
                    O,
                    TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}
                ):Play()
            end
        )
        P.MouseLeave:Connect(
            function()
                b.TweenService:Create(
                    O,
                    TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {BackgroundColor3 = Color3.fromRGB(43, 43, 43)}
                ):Play()
            end
        )
        P.MouseButton1Click:Connect(
            function()
                spawn(
                    function()
                        ClickEffect(P)
                    end
                )
                N()
            end
        )
    end
    function K:Toggle(Q, R, S, N, T)
        local T = T or a.flags
        local R = R or b.HttpService:GenerateGUID()
        local S = S or false
        local N = N or function()
            end
        T[R] = S
        local U = Instance.new("Frame")
        local V = Instance.new("TextButton")
        local W = Instance.new("Frame")
        local X = Instance.new("UICorner")
        U.Name = "ToggleObj"
        U.Parent = E
        U.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        U.BorderSizePixel = 0
        U.Position = UDim2.new(0, 0, 0.0172413792, 0)
        U.Size = UDim2.new(0, 203, 0, 36)
        V.Name = "ToggleText"
        V.Parent = U
        V.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        V.BackgroundTransparency = 1.000
        V.BorderSizePixel = 0
        V.Size = UDim2.new(0, 203, 0, 36)
        V.Font = Enum.Font.Gotham
        V.Text = "  " .. tostring(Q) or ""
        V.TextColor3 = Color3.fromRGB(255, 255, 255)
        V.TextSize = 14.000
        V.TextXAlignment = Enum.TextXAlignment.Left
        W.Name = "ToggleStatus"
        W.Parent = U
        W.AnchorPoint = Vector2.new(0, 0.5)
        W.BackgroundColor3 = S and Color3.fromRGB(14, 255, 110) or Color3.fromRGB(255, 44, 44)
        W.BorderSizePixel = 0
        W.Position = UDim2.new(0.847443342, 0, 0.5, 0)
        W.Size = UDim2.new(0, 24, 0, 24)
        X.CornerRadius = UDim.new(0, 4)
        X.Name = "ToggleStatusRound"
        X.Parent = W
        if S then
            N(true)
        end
        V.MouseEnter:Connect(
            function()
                b.TweenService:Create(
                    U,
                    TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}
                ):Play()
            end
        )
        V.MouseLeave:Connect(
            function()
                b.TweenService:Create(
                    U,
                    TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {BackgroundColor3 = Color3.fromRGB(43, 43, 43)}
                ):Play()
            end
        )
        V.MouseButton1Click:Connect(
            function()
                T[R] = not T[R]
                spawn(
                    function()
                        b.TweenService:Create(
                            W,
                            TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                            {BackgroundColor3 = T[R] and Color3.fromRGB(14, 255, 110) or Color3.fromRGB(255, 44, 44)}
                        ):Play()
                    end
                )
                spawn(
                    function()
                        ClickEffect(V)
                    end
                )
                N(T[R])
            end
        )
    end
    function K:Slider(Y, Z, _, a0, N, S, T)
        local a1 = _ or 0
        local a2 = a0 or 100
        local a3 = Z or b.HttpService:GenerateGUID()
        local N = N or function()
            end
        local T = T or a.flags
        local k = false
        T[a3] = S or a1
        local a4 = Instance.new("Frame")
        local a5 = Instance.new("TextButton")
        local a6 = Instance.new("Frame")
        local a7 = Instance.new("UICorner")
        local a8 = Instance.new("Frame")
        local a9 = Instance.new("UICorner")
        local aa = Instance.new("TextLabel")
        a4.Name = "SliderObj"
        a4.Parent = E
        a4.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        a4.BorderSizePixel = 0
        a4.Position = UDim2.new(0, 0, 0.0172413792, 0)
        a4.Size = UDim2.new(0, 203, 0, 36)
        a5.Name = "SliderText"
        a5.Parent = a4
        a5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        a5.BackgroundTransparency = 1.000
        a5.BorderSizePixel = 0
        a5.Size = UDim2.new(0, 203, 0, 36)
        a5.Font = Enum.Font.Gotham
        a5.Text = "  " .. tostring(Y) or ""
        a5.TextColor3 = Color3.fromRGB(255, 255, 255)
        a5.TextSize = 14.000
        a5.TextXAlignment = Enum.TextXAlignment.Left
        a6.Name = "SliderBack"
        a6.Parent = a4
        a6.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
        a6.BorderSizePixel = 0
        a6.Position = UDim2.new(0.57099998, 0, 0.680000007, 0)
        a6.Size = UDim2.new(0, 80, 0, 7)
        a7.CornerRadius = UDim.new(0, 4)
        a7.Name = "SliderBackRound"
        a7.Parent = a6
        a8.Name = "SliderPart"
        a8.Parent = a6
        a8.BackgroundColor3 = Color3.fromRGB(131, 133, 255)
        a8.BorderSizePixel = 0
        a8.Size = UDim2.new((S or 0) / a2, 0, 1, 0)
        a9.CornerRadius = UDim.new(0, 4)
        a9.Name = "SliderPartRound"
        a9.Parent = a8
        aa.Name = "SliderValue"
        aa.Parent = a4
        aa.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        aa.BackgroundTransparency = 1.000
        aa.BorderSizePixel = 0
        aa.Position = UDim2.new(0.571428597, 0, 0.166666672, 0)
        aa.Size = UDim2.new(0, 80, 0, 16)
        aa.Font = Enum.Font.Code
        aa.Text = S or a1
        aa.TextColor3 = Color3.fromRGB(255, 255, 255)
        aa.TextSize = 14.000
        if S and S ~= a1 then
            N(S)
        end
        local function ab(p)
            local ac = UDim2.new(math.clamp((p.Position.X - a6.AbsolutePosition.X) / a6.AbsoluteSize.X, 0, 1), 0, 1, 0)
            a8:TweenSize(ac, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.05, true)
            local ad = math.floor(ac.X.Scale * a2 / a2 * (a2 - a1) + a1)
            aa.Text = tostring(ad)
            T[a3] = ad
            N(ad)
        end
        a5.InputBegan:Connect(
            function(p)
                if p.UserInputType == Enum.UserInputType.MouseButton1 then
                    spawn(
                        function()
                            b.TweenService:Create(
                                a8,
                                TweenInfo.new(0.15),
                                {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
                            ):Play()
                        end
                    )
                    ab(p)
                    k = true
                end
            end
        )
        a5.InputEnded:Connect(
            function(p)
                if p.UserInputType == Enum.UserInputType.MouseButton1 then
                    spawn(
                        function()
                            b.TweenService:Create(
                                a8,
                                TweenInfo.new(0.15),
                                {BackgroundColor3 = Color3.fromRGB(131, 133, 255)}
                            ):Play()
                        end
                    )
                    k = false
                end
            end
        )
        b.UserInputService.InputChanged:Connect(
            function(p)
                if k and p.UserInputType == Enum.UserInputType.MouseMovement then
                    ab(p)
                end
            end
        )
    end
    function K:Dropdown(Text, Options, Callback)
        local DropdownObj = Instance.new("Frame")
        local DropdownButton = Instance.new("TextButton")
        local DropdownList = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        local isOpen = false
        local DropdownHeight = 36 -- Height of the dropdown button

        DropdownObj.Name = "DropdownObj"
        DropdownObj.Parent = E
        DropdownObj.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        DropdownObj.BorderSizePixel = 0
        DropdownObj.Position = UDim2.new(0, 0, 0.0172413792, 0)
        DropdownObj.Size = UDim2.new(0, 203, 0, DropdownHeight)

        DropdownButton.Name = "DropdownButton"
        DropdownButton.Parent = DropdownObj
        DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DropdownButton.BackgroundTransparency = 1.000
        DropdownButton.BorderSizePixel = 0
        DropdownButton.Size = UDim2.new(0, 203, 0, DropdownHeight)
        DropdownButton.Font = Enum.Font.Gotham
        DropdownButton.Text = "  " .. tostring(Text) or ""
        DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        DropdownButton.TextSize = 14.000
        DropdownButton.TextXAlignment = Enum.TextXAlignment.Left

        DropdownList.Name = "DropdownList"
        DropdownList.Parent = DropdownObj
        DropdownList.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
        DropdownList.BorderSizePixel = 0
        DropdownList.Position = UDim2.new(0, 0, 1, 0)
        DropdownList.Size = UDim2.new(0, 203, 0, 0)
        DropdownList.ClipsDescendants = true
        DropdownList.Visible = false

        UIListLayout.Parent = DropdownList
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 4)

        local function UpdateDropdown()
            local ListSize = 0
            for _, v in ipairs(DropdownList:GetChildren()) do
                if v:IsA("TextButton") then
                    ListSize = ListSize + v.Size.Y.Offset + 4
                end
            end
            b.TweenService:Create(
                DropdownList,
                TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {Size = UDim2.new(0, 203, 0, isOpen and ListSize or 0)}
            ):Play()
            b.TweenService:Create(
                E,
                TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {Size = UDim2.new(0, 212, 0, isOpen and (E.Size.Y.Offset + ListSize) or (E.Size.Y.Offset - ListSize))}
            ):Play()
        end

        DropdownButton.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            DropdownList.Visible = isOpen
            UpdateDropdown()
        end)

        for _, Option in ipairs(Options) do
            local OptionButton = Instance.new("TextButton")
            OptionButton.Name = "OptionButton"
            OptionButton.Parent = DropdownList
            OptionButton.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            OptionButton.BorderSizePixel = 0
            OptionButton.Size = UDim2.new(0, 203, 0, 26)
            OptionButton.Font = Enum.Font.Gotham
            OptionButton.Text = "  " .. tostring(Option) or ""
            OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            OptionButton.TextSize = 14.000
            OptionButton.TextXAlignment = Enum.TextXAlignment.Left

            OptionButton.MouseButton1Click:Connect(function()
                DropdownButton.Text = "  " .. tostring(Text) .. ": " .. tostring(Option)
                isOpen = false
                DropdownList.Visible = false
                UpdateDropdown()
                Callback(Option)
            end)
        end
    end
    function K:Textbox(Text, Placeholder, Callback)
        local TextboxObj = Instance.new("Frame")
        local TextboxButton = Instance.new("TextButton")
        local TextboxInput = Instance.new("TextBox")

        TextboxObj.Name = "TextboxObj"
        TextboxObj.Parent = E
        TextboxObj.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        TextboxObj.BorderSizePixel = 0
        TextboxObj.Position = UDim2.new(0, 0, 0.0172413792, 0)
        TextboxObj.Size = UDim2.new(0, 203, 0, 36)

        TextboxButton.Name = "TextboxButton"
        TextboxButton.Parent = TextboxObj
        TextboxButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextboxButton.BackgroundTransparency = 1.000
        TextboxButton.BorderSizePixel = 0
        TextboxButton.Size = UDim2.new(0, 203, 0, 36)
        TextboxButton.Font = Enum.Font.Gotham
        TextboxButton.Text = "  " .. tostring(Text) or ""
        TextboxButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextboxButton.TextSize = 14.000
        TextboxButton.TextXAlignment = Enum.TextXAlignment.Left

        TextboxInput.Name = "TextboxInput"
        TextboxInput.Parent = TextboxObj
        TextboxInput.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
        TextboxInput.BorderSizePixel = 0
        TextboxInput.Position = UDim2.new(0.57099998, 0, 0.25, 0)
        TextboxInput.Size = UDim2.new(0, 80, 0, 20)
        TextboxInput.Font = Enum.Font.Gotham
        TextboxInput.PlaceholderText = Placeholder
        TextboxInput.Text = ""
        TextboxInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextboxInput.TextSize = 14.000
        TextboxInput.ClearTextOnFocus = false
        TextboxInput.TextWrapped = true

        TextboxInput.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                Callback(TextboxInput.Text)
            end
        end)
    end
    return K
end
return a
