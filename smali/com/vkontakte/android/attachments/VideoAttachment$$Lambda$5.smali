.class final synthetic Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/attachments/VideoAttachment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/attachments/VideoAttachment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$5;->arg$1:Lcom/vkontakte/android/attachments/VideoAttachment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/attachments/VideoAttachment;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$5;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$5;-><init>(Lcom/vkontakte/android/attachments/VideoAttachment;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$$Lambda$5;->arg$1:Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->lambda$pause$4()V

    return-void
.end method
