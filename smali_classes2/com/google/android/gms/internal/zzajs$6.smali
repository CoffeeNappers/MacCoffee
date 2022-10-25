.class Lcom/google/android/gms/internal/zzajs$6;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/Transaction$Handler;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aZd:Lcom/google/firebase/database/Transaction$Handler;

.field final synthetic bdZ:Lcom/google/android/gms/internal/zzajs;

.field final synthetic bee:Lcom/google/firebase/database/DatabaseError;

.field final synthetic bef:Lcom/google/firebase/database/DataSnapshot;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/Transaction$Handler;Lcom/google/firebase/database/DatabaseError;Lcom/google/firebase/database/DataSnapshot;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$6;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajs$6;->aZd:Lcom/google/firebase/database/Transaction$Handler;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzajs$6;->bee:Lcom/google/firebase/database/DatabaseError;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzajs$6;->bef:Lcom/google/firebase/database/DataSnapshot;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$6;->aZd:Lcom/google/firebase/database/Transaction$Handler;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$6;->bee:Lcom/google/firebase/database/DatabaseError;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/android/gms/internal/zzajs$6;->bef:Lcom/google/firebase/database/DataSnapshot;

    invoke-interface {v0, v1, v2, v3}, Lcom/google/firebase/database/Transaction$Handler;->onComplete(Lcom/google/firebase/database/DatabaseError;ZLcom/google/firebase/database/DataSnapshot;)V

    return-void
.end method
