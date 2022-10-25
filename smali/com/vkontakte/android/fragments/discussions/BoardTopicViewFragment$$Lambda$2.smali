.class final synthetic Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)V

    return-object v0
.end method


# virtual methods
.method public sendGraffiti(Lcom/vkontakte/android/attachments/GraffitiAttachment;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->lambda$onCreateContentView$1(Lcom/vkontakte/android/attachments/GraffitiAttachment;)V

    return-void
.end method
