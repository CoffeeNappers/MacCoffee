.class final synthetic Lcom/vk/stories/dialog/StorySendMessageDialog$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vk/stories/dialog/StorySendMessageDialog;


# direct methods
.method private constructor <init>(Lcom/vk/stories/dialog/StorySendMessageDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog$$Lambda$1;->arg$1:Lcom/vk/stories/dialog/StorySendMessageDialog;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/dialog/StorySendMessageDialog;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/stories/dialog/StorySendMessageDialog$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vk/stories/dialog/StorySendMessageDialog$$Lambda$1;-><init>(Lcom/vk/stories/dialog/StorySendMessageDialog;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/dialog/StorySendMessageDialog$$Lambda$1;->arg$1:Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-virtual {v0, p1}, Lcom/vk/stories/dialog/StorySendMessageDialog;->lambda$new$0(Landroid/view/View;)V

    return-void
.end method
