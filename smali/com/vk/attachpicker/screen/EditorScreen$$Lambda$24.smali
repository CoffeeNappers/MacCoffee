.class final synthetic Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$24;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;


# instance fields
.field private final arg$1:Lcom/vk/attachpicker/screen/EditorScreen;


# direct methods
.method private constructor <init>(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$24;->arg$1:Lcom/vk/attachpicker/screen/EditorScreen;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$24;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$24;-><init>(Lcom/vk/attachpicker/screen/EditorScreen;)V

    return-object v0
.end method


# virtual methods
.method public onApply(Ljava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$24;->arg$1:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vk/attachpicker/screen/EditorScreen;->lambda$onTextClick$23(Ljava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;)V

    return-void
.end method
