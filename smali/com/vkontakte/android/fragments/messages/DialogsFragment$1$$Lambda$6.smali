.class final synthetic Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;

.field private final arg$2:I

.field private final arg$3:Lcom/vkontakte/android/DialogEntry;

.field private final arg$4:I


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;ILcom/vkontakte/android/DialogEntry;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$6;->arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;

    iput p2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$6;->arg$2:I

    iput-object p3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$6;->arg$3:Lcom/vkontakte/android/DialogEntry;

    iput p4, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$6;->arg$4:I

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;ILcom/vkontakte/android/DialogEntry;I)Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$6;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$6;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;ILcom/vkontakte/android/DialogEntry;I)V

    return-object v0
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$6;->arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;

    iget v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$6;->arg$2:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$6;->arg$3:Lcom/vkontakte/android/DialogEntry;

    iget v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$6;->arg$4:I

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->lambda$null$2(ILcom/vkontakte/android/DialogEntry;ILjava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
