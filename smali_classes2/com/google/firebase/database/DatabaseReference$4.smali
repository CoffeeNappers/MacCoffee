.class Lcom/google/firebase/database/DatabaseReference$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/database/DatabaseReference;->runTransaction(Lcom/google/firebase/database/Transaction$Handler;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aYZ:Lcom/google/firebase/database/DatabaseReference;

.field final synthetic aZd:Lcom/google/firebase/database/Transaction$Handler;

.field final synthetic aZe:Z


# direct methods
.method constructor <init>(Lcom/google/firebase/database/DatabaseReference;Lcom/google/firebase/database/Transaction$Handler;Z)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/database/DatabaseReference$4;->aYZ:Lcom/google/firebase/database/DatabaseReference;

    iput-object p2, p0, Lcom/google/firebase/database/DatabaseReference$4;->aZd:Lcom/google/firebase/database/Transaction$Handler;

    iput-boolean p3, p0, Lcom/google/firebase/database/DatabaseReference$4;->aZe:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/database/DatabaseReference$4;->aYZ:Lcom/google/firebase/database/DatabaseReference;

    iget-object v0, v0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v1, p0, Lcom/google/firebase/database/DatabaseReference$4;->aYZ:Lcom/google/firebase/database/DatabaseReference;

    invoke-virtual {v1}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    iget-object v2, p0, Lcom/google/firebase/database/DatabaseReference$4;->aZd:Lcom/google/firebase/database/Transaction$Handler;

    iget-boolean v3, p0, Lcom/google/firebase/database/DatabaseReference$4;->aZe:Z

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/Transaction$Handler;Z)V

    return-void
.end method
