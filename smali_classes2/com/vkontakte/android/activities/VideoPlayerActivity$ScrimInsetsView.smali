.class public Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;
.super Landroid/view/View;
.source "VideoPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ScrimInsetsView"
.end annotation


# instance fields
.field bottomGradient:Landroid/graphics/drawable/Drawable;

.field final edgePaint:Landroid/graphics/Paint;

.field final insets:Landroid/graphics/Rect;

.field topGradient:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v2, 0x80

    .line 1253
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 1247
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->insets:Landroid/graphics/Rect;

    .line 1248
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->edgePaint:Landroid/graphics/Paint;

    .line 1271
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->edgePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1272
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0203b8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->topGradient:Landroid/graphics/drawable/Drawable;

    .line 1273
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0203b3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->bottomGradient:Landroid/graphics/drawable/Drawable;

    .line 1274
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->topGradient:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1275
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->bottomGradient:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1254
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/16 v2, 0x80

    .line 1257
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 1247
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->insets:Landroid/graphics/Rect;

    .line 1248
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->edgePaint:Landroid/graphics/Paint;

    .line 1271
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->edgePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1272
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0203b8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->topGradient:Landroid/graphics/drawable/Drawable;

    .line 1273
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0203b3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->bottomGradient:Landroid/graphics/drawable/Drawable;

    .line 1274
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->topGradient:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1275
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->bottomGradient:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1258
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/16 v2, 0x80

    .line 1261
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 1247
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->insets:Landroid/graphics/Rect;

    .line 1248
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->edgePaint:Landroid/graphics/Paint;

    .line 1271
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->edgePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1272
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0203b8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->topGradient:Landroid/graphics/drawable/Drawable;

    .line 1273
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0203b3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->bottomGradient:Landroid/graphics/drawable/Drawable;

    .line 1274
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->topGradient:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1275
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->bottomGradient:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1262
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/support/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .prologue
    const/16 v2, 0x80

    .line 1267
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 1247
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->insets:Landroid/graphics/Rect;

    .line 1248
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->edgePaint:Landroid/graphics/Paint;

    .line 1271
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->edgePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1272
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0203b8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->topGradient:Landroid/graphics/drawable/Drawable;

    .line 1273
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0203b3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->bottomGradient:Landroid/graphics/drawable/Drawable;

    .line 1274
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->topGradient:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1275
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->bottomGradient:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1268
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x0

    .line 1280
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 1281
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->getHeight()I

    move-result v1

    div-int/lit8 v0, v1, 0x2

    .line 1282
    .local v0, "helpHeight":I
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->topGradient:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->getWidth()I

    move-result v2

    invoke-virtual {v1, v4, v4, v2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1283
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->bottomGradient:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->getHeight()I

    move-result v3

    invoke-virtual {v1, v4, v0, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1284
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->topGradient:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1285
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->bottomGradient:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1286
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "insets"    # Landroid/graphics/Rect;

    .prologue
    .line 1289
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->insets:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 1290
    invoke-virtual {p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->invalidate()V

    .line 1291
    return-void
.end method
