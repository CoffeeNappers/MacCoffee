.class public final enum Lcom/vk/attachpicker/stickers/StickerStyle;
.super Ljava/lang/Enum;
.source "StickerStyle.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/attachpicker/stickers/StickerStyle;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/attachpicker/stickers/StickerStyle;

.field public static final enum IMPACT:Lcom/vk/attachpicker/stickers/StickerStyle;

.field public static final enum LOBSTER_REGULAR:Lcom/vk/attachpicker/stickers/StickerStyle;

.field public static final enum ROBOTO_BOLD:Lcom/vk/attachpicker/stickers/StickerStyle;

.field public static final enum ROBOTO_FIXED:Lcom/vk/attachpicker/stickers/StickerStyle;


# instance fields
.field final background:I

.field final canRotate:Z

.field final canScale:Z

.field final canTranslateX:Z

.field final canTranslateY:Z

.field final fontSize:I

.field final fullWidth:Z

.field final iconResId:I

.field final typeface:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .prologue
    .line 12
    new-instance v0, Lcom/vk/attachpicker/stickers/StickerStyle;

    const-string/jumbo v1, "ROBOTO_BOLD"

    const/4 v2, 0x0

    const v3, 0x7f020376

    invoke-static {}, Lcom/vk/attachpicker/util/Fonts;->getRobotoBold()Landroid/graphics/Typeface;

    move-result-object v4

    const/16 v5, 0x28

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    const/4 v6, 0x1

    const/4 v7, 0x1

    const/4 v8, 0x1

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v0 .. v11}, Lcom/vk/attachpicker/stickers/StickerStyle;-><init>(Ljava/lang/String;IILandroid/graphics/Typeface;IZZZZZI)V

    sput-object v0, Lcom/vk/attachpicker/stickers/StickerStyle;->ROBOTO_BOLD:Lcom/vk/attachpicker/stickers/StickerStyle;

    .line 13
    new-instance v0, Lcom/vk/attachpicker/stickers/StickerStyle;

    const-string/jumbo v1, "LOBSTER_REGULAR"

    const/4 v2, 0x1

    const v3, 0x7f020377

    invoke-static {}, Lcom/vk/attachpicker/util/Fonts;->getLobsterRegular()Landroid/graphics/Typeface;

    move-result-object v4

    const/16 v5, 0x28

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    const/4 v6, 0x1

    const/4 v7, 0x1

    const/4 v8, 0x1

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v0 .. v11}, Lcom/vk/attachpicker/stickers/StickerStyle;-><init>(Ljava/lang/String;IILandroid/graphics/Typeface;IZZZZZI)V

    sput-object v0, Lcom/vk/attachpicker/stickers/StickerStyle;->LOBSTER_REGULAR:Lcom/vk/attachpicker/stickers/StickerStyle;

    .line 14
    new-instance v0, Lcom/vk/attachpicker/stickers/StickerStyle;

    const-string/jumbo v1, "IMPACT"

    const/4 v2, 0x2

    const v3, 0x7f020378

    invoke-static {}, Lcom/vk/attachpicker/util/Fonts;->getImpact()Landroid/graphics/Typeface;

    move-result-object v4

    const/16 v5, 0x28

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    const/4 v6, 0x1

    const/4 v7, 0x1

    const/4 v8, 0x1

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v0 .. v11}, Lcom/vk/attachpicker/stickers/StickerStyle;-><init>(Ljava/lang/String;IILandroid/graphics/Typeface;IZZZZZI)V

    sput-object v0, Lcom/vk/attachpicker/stickers/StickerStyle;->IMPACT:Lcom/vk/attachpicker/stickers/StickerStyle;

    .line 15
    new-instance v0, Lcom/vk/attachpicker/stickers/StickerStyle;

    const-string/jumbo v1, "ROBOTO_FIXED"

    const/4 v2, 0x3

    const v3, 0x7f020379

    invoke-static {}, Lcom/vk/attachpicker/util/Fonts;->getRobotoRegular()Landroid/graphics/Typeface;

    move-result-object v4

    const/16 v5, 0x12

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/high16 v11, 0x7f000000

    invoke-direct/range {v0 .. v11}, Lcom/vk/attachpicker/stickers/StickerStyle;-><init>(Ljava/lang/String;IILandroid/graphics/Typeface;IZZZZZI)V

    sput-object v0, Lcom/vk/attachpicker/stickers/StickerStyle;->ROBOTO_FIXED:Lcom/vk/attachpicker/stickers/StickerStyle;

    .line 10
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/vk/attachpicker/stickers/StickerStyle;

    const/4 v1, 0x0

    sget-object v2, Lcom/vk/attachpicker/stickers/StickerStyle;->ROBOTO_BOLD:Lcom/vk/attachpicker/stickers/StickerStyle;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/vk/attachpicker/stickers/StickerStyle;->LOBSTER_REGULAR:Lcom/vk/attachpicker/stickers/StickerStyle;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/vk/attachpicker/stickers/StickerStyle;->IMPACT:Lcom/vk/attachpicker/stickers/StickerStyle;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/vk/attachpicker/stickers/StickerStyle;->ROBOTO_FIXED:Lcom/vk/attachpicker/stickers/StickerStyle;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vk/attachpicker/stickers/StickerStyle;->$VALUES:[Lcom/vk/attachpicker/stickers/StickerStyle;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILandroid/graphics/Typeface;IZZZZZI)V
    .locals 0
    .param p3, "iconResId"    # I
    .param p4, "typeface"    # Landroid/graphics/Typeface;
    .param p5, "fontSize"    # I
    .param p6, "canRotate"    # Z
    .param p7, "canScale"    # Z
    .param p8, "canTranslateX"    # Z
    .param p9, "canTranslateY"    # Z
    .param p10, "fullWidth"    # Z
    .param p11, "background"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/graphics/Typeface;",
            "IZZZZZI)V"
        }
    .end annotation

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 28
    iput p3, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->iconResId:I

    .line 29
    iput-object p4, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->typeface:Landroid/graphics/Typeface;

    .line 30
    iput p5, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->fontSize:I

    .line 31
    iput-boolean p6, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->canRotate:Z

    .line 32
    iput-boolean p7, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->canScale:Z

    .line 33
    iput-boolean p8, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->canTranslateX:Z

    .line 34
    iput-boolean p9, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->canTranslateY:Z

    .line 35
    iput-boolean p10, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->fullWidth:Z

    .line 36
    iput p11, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->background:I

    .line 37
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/attachpicker/stickers/StickerStyle;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 10
    const-class v0, Lcom/vk/attachpicker/stickers/StickerStyle;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/stickers/StickerStyle;

    return-object v0
.end method

.method public static values()[Lcom/vk/attachpicker/stickers/StickerStyle;
    .locals 1

    .prologue
    .line 10
    sget-object v0, Lcom/vk/attachpicker/stickers/StickerStyle;->$VALUES:[Lcom/vk/attachpicker/stickers/StickerStyle;

    invoke-virtual {v0}, [Lcom/vk/attachpicker/stickers/StickerStyle;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/attachpicker/stickers/StickerStyle;

    return-object v0
.end method


# virtual methods
.method public fixedStyle()Z
    .locals 1

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->canTranslateX:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->canTranslateY:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->canRotate:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/attachpicker/stickers/StickerStyle;->canScale:Z

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
