.class final synthetic Lcom/vk/attachpicker/GraffitiConfirmDialog$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vk/attachpicker/GraffitiConfirmDialog;


# direct methods
.method private constructor <init>(Lcom/vk/attachpicker/GraffitiConfirmDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog$$Lambda$2;->arg$1:Lcom/vk/attachpicker/GraffitiConfirmDialog;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/attachpicker/GraffitiConfirmDialog;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/GraffitiConfirmDialog$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/GraffitiConfirmDialog$$Lambda$2;-><init>(Lcom/vk/attachpicker/GraffitiConfirmDialog;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiConfirmDialog$$Lambda$2;->arg$1:Lcom/vk/attachpicker/GraffitiConfirmDialog;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/GraffitiConfirmDialog;->lambda$new$1(Landroid/view/View;)V

    return-void
.end method
