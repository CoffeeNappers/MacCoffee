.class final synthetic Lcom/vk/attachpicker/stickers/TextStickerDialog$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vk/attachpicker/stickers/TextStickerDialog;

.field private final arg$2:Z


# direct methods
.method private constructor <init>(Lcom/vk/attachpicker/stickers/TextStickerDialog;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog$$Lambda$3;->arg$1:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    iput-boolean p2, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog$$Lambda$3;->arg$2:Z

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/attachpicker/stickers/TextStickerDialog;Z)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/stickers/TextStickerDialog$$Lambda$3;

    invoke-direct {v0, p0, p1}, Lcom/vk/attachpicker/stickers/TextStickerDialog$$Lambda$3;-><init>(Lcom/vk/attachpicker/stickers/TextStickerDialog;Z)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog$$Lambda$3;->arg$1:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    iget-boolean v1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog$$Lambda$3;->arg$2:Z

    invoke-virtual {v0, v1, p1}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->lambda$new$2(ZLandroid/view/View;)V

    return-void
.end method
