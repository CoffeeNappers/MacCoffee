.class final synthetic Lcom/vkontakte/android/data/Messages$5$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/Friends$GetUsersCallback;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/data/VKList;

.field private final arg$2:Lcom/vkontakte/android/data/Messages$GetDialogsCallback;

.field private final arg$3:I


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/data/VKList;Lcom/vkontakte/android/data/Messages$GetDialogsCallback;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/data/Messages$5$$Lambda$1;->arg$1:Lcom/vkontakte/android/data/VKList;

    iput-object p2, p0, Lcom/vkontakte/android/data/Messages$5$$Lambda$1;->arg$2:Lcom/vkontakte/android/data/Messages$GetDialogsCallback;

    iput p3, p0, Lcom/vkontakte/android/data/Messages$5$$Lambda$1;->arg$3:I

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/data/VKList;Lcom/vkontakte/android/data/Messages$GetDialogsCallback;I)Lcom/vkontakte/android/data/Friends$GetUsersCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/data/Messages$5$$Lambda$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/data/Messages$5$$Lambda$1;-><init>(Lcom/vkontakte/android/data/VKList;Lcom/vkontakte/android/data/Messages$GetDialogsCallback;I)V

    return-object v0
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;)V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/data/Messages$5$$Lambda$1;->arg$1:Lcom/vkontakte/android/data/VKList;

    iget-object v1, p0, Lcom/vkontakte/android/data/Messages$5$$Lambda$1;->arg$2:Lcom/vkontakte/android/data/Messages$GetDialogsCallback;

    iget v2, p0, Lcom/vkontakte/android/data/Messages$5$$Lambda$1;->arg$3:I

    invoke-static {v0, v1, v2, p1}, Lcom/vkontakte/android/data/Messages$5;->lambda$success$0(Lcom/vkontakte/android/data/VKList;Lcom/vkontakte/android/data/Messages$GetDialogsCallback;ILjava/util/ArrayList;)V

    return-void
.end method
