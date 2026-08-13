Add-Type -AssemblyName System.Drawing

$root = Split-Path -Parent $PSScriptRoot
$output = Join-Path $root "media\proper_camera_thumbnail.png"
$size = 512
$scale = $size / 256.0
$bitmap = [System.Drawing.Bitmap]::new($size, $size)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)

try {
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.Clear([System.Drawing.ColorTranslator]::FromHtml("#101b2d"))

    $cameraBrush = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml("#2d83b7"))
    $lightBrush = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml("#d7f2ff"))
    $lensBrush = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml("#18314b"))
    $accentPen = [System.Drawing.Pen]::new([System.Drawing.ColorTranslator]::FromHtml("#f6c653"), 12 * $scale)
    $accentPen.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $accentPen.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
    $body = [System.Drawing.Drawing2D.GraphicsPath]::new()
    $body.AddPolygon([System.Drawing.PointF[]]@(
        [System.Drawing.PointF]::new(44*$scale, 91*$scale),
        [System.Drawing.PointF]::new(90*$scale, 91*$scale),
        [System.Drawing.PointF]::new(105*$scale, 67*$scale),
        [System.Drawing.PointF]::new(151*$scale, 67*$scale),
        [System.Drawing.PointF]::new(166*$scale, 91*$scale),
        [System.Drawing.PointF]::new(212*$scale, 91*$scale),
        [System.Drawing.PointF]::new(236*$scale, 115*$scale),
        [System.Drawing.PointF]::new(236*$scale, 188*$scale),
        [System.Drawing.PointF]::new(212*$scale, 212*$scale),
        [System.Drawing.PointF]::new(44*$scale, 212*$scale),
        [System.Drawing.PointF]::new(20*$scale, 188*$scale),
        [System.Drawing.PointF]::new(20*$scale, 115*$scale)
    ))
    $graphics.FillPath($cameraBrush, $body)
    $graphics.FillEllipse($lightBrush, 81*$scale, 104*$scale, 94*$scale, 94*$scale)
    $graphics.FillEllipse($lensBrush, 98*$scale, 121*$scale, 60*$scale, 60*$scale)
    $graphics.DrawLine($accentPen, 198*$scale, 42*$scale, 198*$scale, 85*$scale)
    $graphics.DrawLine($accentPen, 176.5*$scale, 63.5*$scale, 219.5*$scale, 63.5*$scale)
    $bitmap.Save($output, [System.Drawing.Imaging.ImageFormat]::Png)
}
finally {
    if ($body) { $body.Dispose() }
    if ($accentPen) { $accentPen.Dispose() }
    if ($cameraBrush) { $cameraBrush.Dispose() }
    if ($lightBrush) { $lightBrush.Dispose() }
    if ($lensBrush) { $lensBrush.Dispose() }
    $graphics.Dispose()
    $bitmap.Dispose()
}
