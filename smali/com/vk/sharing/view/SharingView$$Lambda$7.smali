.class final synthetic Lcom/vk/sharing/view/SharingView$$Lambda$7;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Landroid/widget/EditText;


# direct methods
.method private constructor <init>(Landroid/widget/EditText;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/sharing/view/SharingView$$Lambda$7;->arg$1:Landroid/widget/EditText;

    return-void
.end method

.method public static lambdaFactory$(Landroid/widget/EditText;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/sharing/view/SharingView$$Lambda$7;

    invoke-direct {v0, p0}, Lcom/vk/sharing/view/SharingView$$Lambda$7;-><init>(Landroid/widget/EditText;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/sharing/view/SharingView$$Lambda$7;->arg$1:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    return-void
.end method
